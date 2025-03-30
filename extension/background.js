chrome.runtime.onMessage.addListener((request, sender, sendResponse) => {
  if (request.action === 'scan') {
    fetch(http://localhost:5000/scan?contract=)
      .then(res => res.json())
      .then(data => {
        if (data.pain_score > 70) {
          chrome.action.setBadgeText({text: '!'});
          chrome.notifications.create('risk-alert', {
            type: 'basic',
            iconUrl: 'icons/warning.png',
            title: 'High Risk Contract',
            message: Score:  - 
          });
        }
        sendResponse(data);
      });
    return true;
  }
});
