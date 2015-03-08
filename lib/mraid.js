// MRAID mock.
window.mraid = {
  addEventListener: function(event, handler) {
    window.console && console.log('mraid.addEventListener(\'' + event + '\')');
  },
  close: function() {
    window.console && console.log('mraid.close()');
  },
  expand: function(url) {
    window.console && console.log('mraid.expand(' + url + ')');
  },
  getPlacementType: function() {
    return 'TBD';
  },
  getState: function() {
    return 'state';
  },
  getVersion: function() {
    return 'mock';
  },
  isViewable: function() {
    return true;
  },
  open: function(url) {
    window.console && console.log('mraid.open(\'' + url + '\')');
  }
};
