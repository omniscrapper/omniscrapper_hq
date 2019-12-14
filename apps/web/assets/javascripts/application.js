window.onload = () => {
  const dangerBtns = document.querySelectorAll('.btn-danger');
  [].forEach.call(dangerBtns, btn => btn.setAttribute('data-confirm',
                                                      'Please confirm this action'
                                                     ));
}
