chrome.runtime.onMessage.addListener((request) => {
  if (request.painScore > 70) {
    chrome.notifications.create({
      title: '⚠️ High-Risk Contract',
      message: Score: ,
      iconUrl: 'icon.png'
    });
  }
});
