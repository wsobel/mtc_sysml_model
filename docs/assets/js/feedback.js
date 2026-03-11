---
layout: null
---
document.addEventListener('DOMContentLoaded', function() {
  const btn = document.getElementById('feedback-btn');
  const panel = document.getElementById('feedback-panel');
  const submitBtn = document.getElementById('feedback-submit');
  const cancelBtn = document.getElementById('feedback-cancel');
  const textarea = document.getElementById('feedback-text');
  const subject = document.getElementById('feedback-subject');
  const status = document.getElementById('feedback-status');

  btn.addEventListener('click', () => {
    panel.style.display = 'block';
    btn.style.display = 'none';
  });

  cancelBtn.addEventListener('click', () => {
    panel.style.display = 'none';
    btn.style.display = 'inline-block';
  });

  submitBtn.addEventListener('click', async () => {
    const message = textarea.value.trim();
    if (!message) {
      status.textContent = 'Please enter a message.';
      return;
    }

    status.textContent = 'Sending...';
    try {
      const { token } = await (await fetch('{{ site.comment_url }}/csrf_token', {
        credentials: 'include'
      })).json();

      const response = await fetch('{{ site.comment_url }}/cameo_comment', {
        method: 'POST',
        credentials: 'include',
        headers: { 'Content-Type': 'application/json', 'X-CSRF-Token': token },
        body: JSON.stringify({
          url: window.location.href,
          title: document.title,
          summary: subject.value.trim() || 'General Feedback',
          comment: message,
        })
      });

      if (response.ok) {
        status.textContent = 'Sent!';
        textarea.value = '';
        subject.value = '';
        setTimeout(() => { panel.style.display = 'none'; btn.style.display = 'inline-block'; status.textContent = ''; }, 2000);
      } else {
        status.textContent = 'Error : ' + await response.text();
      }
    } catch (e) {
      status.textContent = 'Network error.';
    }
  });
});
