window.BoardApp = {layout:"dashboard"}

router = new RouterRouter
router.route 'boards/:id', () ->
  window.BoardApp.view = "boards"
