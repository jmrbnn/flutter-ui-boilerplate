globalThis.onAppInit = async () => {
  console.info("Flutter says %cHow you doin'?", "color: #1b9df0");

  const { appState } = globalThis;
  sessionInfo = {}

  appState.streamController?.stream?.listen((payload) => {

    const data = payload.split('|||');
    console.log(data);
    if(data.length == 3){
      if(data[0] == 'ADD'){
        sessionInfo[data[1]] = IsJsonString(data[2]) ? JSON.parse(data[2]) : data[2];
        window.sessionStorage.setItem(data[1], data[2]);
      }
      if(data[0] == 'REMOVE'){
        delete sessionInfo[data[1]]
        window.sessionStorage.removeItem(data[1]);
      }
    }
    console.log(sessionInfo);
  });
};

function IsJsonString(str) {
  try {
    var json = JSON.parse(str);
    return (typeof json === 'object');
  } catch (e) {
    return false;
  }
}

async function toggleBrightness() {
  appState.toggleBrightness();
}

async function appConfigs({
  appIdentifier = '', authFlow = 'authorization_code'
}) {
  console.log(globalThis.appState);
  globalThis.appState.appConfigurations(appIdentifier, authFlow);
}

async function initEvents(){
  const onAuthenticated = ()=> { 
    session = typeof globalThis.authSession !== 'undefined' ? JSON.parse(globalThis.authSession) : {}
    console.log(session);
    var element = document.getElementById('session-container');
    if(element != null){
      element.innerHTML = JSON.stringify(session);
    }
  };
  const onLoggedOut = ()=> { 
    session = typeof globalThis.authSession !== 'undefined' ? JSON.parse(globalThis.authSession) : {}
    console.log(session);
    var element = document.getElementById('session-container');
    if(element != null){
      element.innerHTML = JSON.stringify(session);
    }

    introspect = typeof globalThis.authIntrospect !== 'undefined' ? JSON.parse(globalThis.authIntrospect) : {}
    console.log(introspect);
    var element1 = document.getElementById('introspect-container');
    if(element1 != null){
      element1.innerHTML = JSON.stringify(introspect);
    }
  };
  const onIntrospect = ()=> { 
    introspect = typeof globalThis.authIntrospect !== 'undefined' ? JSON.parse(globalThis.authIntrospect) : {}
    console.log(introspect);
    var element = document.getElementById('introspect-container');
    if(element != null){
      element.innerHTML = JSON.stringify(introspect);
    }
  };

  window.removeEventListener('authenticated', onAuthenticated);
  window.removeEventListener('logged-out', onLoggedOut);
  window.removeEventListener('introspect', onIntrospect);

  globalThis.appState.initEventListeners(
    onAuthenticated,
    onLoggedOut,
    onIntrospect,
  )
}