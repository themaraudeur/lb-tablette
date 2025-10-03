if (!globalThis.componentsLoaded) {
    globalThis.componentsLoaded = true;

    // --- Fetch NUI général
    globalThis.fetchNui = async (event, data, scriptName) => {
        scriptName = scriptName || globalThis.resourceName;

        if (scriptName !== globalThis.resourceName) {
            console.warn(`The app ${appName} (${globalThis.resourceName}) is fetching from another resource (${scriptName}), this will soon be blocked by FiveM. Read more: https://forum.cfx.re/t/5261145`);
        }

        try {
            const response = await fetch(`https://${scriptName}/${event}`, {
                method: 'post',
                body: JSON.stringify(data)
            });

            if (!response.ok) throw new Error(`${response.status} - ${response.statusText}`);

            return await response.json();
        } catch (err) {
            console.error(`Error fetching ${event} from ${scriptName}`, err);
        }
    };

    // --- Event listener NUI
    globalThis.onNuiEvent = (eventName, cb) => {
        window.addEventListener('message', (event) => {
            if (event.data?.action === eventName) {
                cb(event.data.data);
            }
        });
    };
    globalThis.useNuiEvent = globalThis.onNuiEvent;

    let settingsListeners = [];
    globalThis.onNuiEvent('settingsUpdated', (settings) => {
        globalThis.settings = settings;
        settingsListeners.forEach(cb => cb(settings));
    });
    globalThis.onSettingsChange = (cb) => settingsListeners.push(cb);

    // --- Components global attach
    for (const [name, component] of Object.entries(globalThis.components || {})) {
        globalThis[name] = component;
    }

    // --- Input focus
    let addedHandlers = [];
    function refreshInputs(inputs) {
        inputs.forEach(input => {
            if (addedHandlers.includes(input)) return console.log('already added handler for', input);

            input.addEventListener('focus', () => globalThis.fetchNui('toggleInput', { focused: true }));
            input.addEventListener('blur', () => globalThis.fetchNui('toggleInput', { focused: false }));
            addedHandlers.push(input);
        });
    }
    refreshInputs(document.querySelectorAll('input, textarea'));

    const inputObserver = new MutationObserver(mutations => {
        mutations.forEach(mutation => {
            mutation.addedNodes.forEach(node => {
                if (!node) return;
                if (node.querySelectorAll) refreshInputs(node.querySelectorAll('input, textarea'));
                if (node.tagName === 'INPUT' || node.tagName === 'TEXTAREA') refreshInputs([node]);
            });
        });
    });
    inputObserver.observe(document.body, { childList: true, subtree: true });

    // --- Tablet open/close via NUI
    let uiOpen = false;
    let tabletSettings = {};

    function openUI(data) {
        uiOpen = true;
        if (data) tabletSettings = data;
        document.body.classList.add('tablet-open');
    }

    function closeUI() {
        uiOpen = false;
        document.body.classList.remove('tablet-open');
    }

    // Events from Lua
    globalThis.onNuiEvent('openTablet', openUI);
    globalThis.onNuiEvent('closeTablet', closeUI);
    globalThis.onNuiEvent('updateSettings', (s) => tabletSettings = s);

    // Ask settings from Lua when load
    window.addEventListener('load', async () => {
        const s = await globalThis.fetchNui('requestSettings', {});
        if (s) tabletSettings = s;
    });

    // --- Click event example close button
    document.addEventListener('click', e => {
        if (e.target && e.target.id === 'close-btn') {
            globalThis.fetchNui('closeTablet', {});
        }
    });

    // --- Signal components loaded
    globalThis.postMessage('componentsLoaded', '*');
}
