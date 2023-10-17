const { _flutter, appState } = globalThis;
const hostElement = document.querySelector("#flutter-host");

// Listen until Flutter tells us it's ready to rumble
window.addEventListener('flutter-initialized', function (event) {
  const state = event.detail;
  window['_debugCounter'] = state;
  state.onClicksChanged(() => {
    console.log('New clicks value: ', state.getClicks());
  });
});

function delay(time){
  return new Promise(resolve => setTimeout(resolve, time));
}

window.addEventListener('load', function(ev) {
  var loaderContent = document.querySelector("#loader-content");
  
  // Download main.dart.js
  _flutter.loader.loadEntrypoint({
    serviceWorker: {
      serviceWorkerVersion: serviceWorkerVersion,
    },
    onEntrypointLoaded: function(engineInitializer) {
      engineInitializer.initializeEngine().then(async function(appRunner) {
        loaderContent.style.opacity = "0";
        await delay(400);
        await appRunner.runApp();

        // await delay(400);
        // globalThis.appConfigs({
        //   appIdentifier: 'GrOB5bRpDypKMxKUEMPb',
        //   authFlow: 'password'
        // });
        // globalThis.initEvents();

        // globalThis.appConfigs({
        //           authUrl: "http://localhost:3002/auth",
          // clientId: "JOLLIBEE-CHOWKING",
          // clientSecret: "UH6SZSaj4q2t0Sl6NZ93T6obIzArrBWu"
        // });
      });
    }
  });
});
