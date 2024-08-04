(()=>{"use strict";const t=function(){function t(t,e,n){this.providedAnswer="",this.question=t,this.options=e,this.correctAnswer=n}return t.prototype.answer=function(t){if(""!==this.providedAnswer)throw new Error("Can not answer twice on the same question");return this.providedAnswer=t,t===this.correctAnswer},t.prototype.getText=function(){return this.question},t.prototype.getOptions=function(){return this.options},t.prototype.getProvidedAnswer=function(){return this.providedAnswer},t.prototype.getCorrectAnswer=function(){return this.correctAnswer},t}();const e=function(){function t(t){this.questions=t,this.currentQuestionNumber=0,this.result=[]}return t.prototype.getCurrentQuestion=function(){var t;return null!==(t=this.questions[this.currentQuestionNumber])&&void 0!==t?t:null},t.prototype.answer=function(t){var e=this.getCurrentQuestion();null!==e?(e.answer(t),this.result[this.currentQuestionNumber]=e,this.currentQuestionNumber+=1):console.error("Runtime error: there are no questions left")},t.prototype.getResult=function(){return this.result},t}();var n=function(){function t(t){this.testUI=document.getElementById("test"),this.test=t,document.getElementById("content").style.display="none"}return t.prototype.render=function(){var t=this.test.getCurrentQuestion();null===t?this.renderResult():this.renderInput(t)},t.prototype.renderResult=function(){var t="",e=this.test.getResult();for(var n in e){var r=parseInt(n)+1,i=e[n];t+="<p>"+r+". "+i.getText()+"</p>";var o=i.getProvidedAnswer(),s=i.getCorrectAnswer();t+=o===s?"<p>✅ "+o+"</p>":"<p>⚠️ "+o+" (правильно: "+s+")</p>"}this.testUI.innerHTML=t},t.prototype.renderInput=function(t){var e=this,n="";n+='<p class="test-question">'+t.getText()+"</p>";for(var r=0,i=t.getOptions();r<i.length;r++){var o=i[r];n+='<div class="answer-option">   <input type="radio" name="answer" value="'+o+'"/>   <label for="answer">'+o+"</label></div>"}this.testUI.innerHTML=n,this.testUI.style.display="block",this.testUI.querySelectorAll('input[type="radio"]').forEach((function(t){var n=t;n.addEventListener("click",(function(){e.test.answer(n.value),e.render()}))}))},t}();const r=n;const i=function(){function n(){}return n.createTranslationTest=function(n){var i=function(){return.5-Math.random()},o=function(t,e){var r=Object.values(n).sort(i);if(r.length-1<e)throw new Error("Requested more translations than we can provide");for(var o=[t];o.length<e+1;){var s=r.shift();s!==t&&o.push(s)}return o.sort(i)},s=[];for(var u in n)s.push(new t('Как сказать "'+u+'"?',o(n[u],3),n[u]));return new r(new e(s))},n.createChoiceTest=function(n){for(var i=[],o=0,s=n;o<s.length;o++){var u=s[o];i.push(new t(u.text,u.choices,u.answer))}return new r(new e(i))},n}();document.addEventListener("DOMContentLoaded",(function(){var t=document.querySelectorAll("[data-description]"),e=document.createElement("span");e.className="tooltip",e.style.visibility="hidden",document.body.appendChild(e);for(var n=function(t){if("visible"!==e.style.visibility){var n=function(t){var e=t.getBoundingClientRect();return{left:e.left+window.scrollX,top:e.top+window.scrollY}}(t.target);e.style.visibility="visible",e.innerText=t.target.dataset.description,e.style.left=n.left+"px",e.style.top=n.top-20+"px"}},r=function(){e.style.visibility="hidden",e.innerText=""},i=0;i<t.length;i++)t[i].addEventListener("mouseover",n),t[i].addEventListener("mouseout",r)}));var o=window;o.registerTranslationTest=function(t){document.addEventListener("DOMContentLoaded",(function(){document.getElementById("start-test").addEventListener("click",(function(){i.createTranslationTest(t).render()}))}))},o.registerChoiceTest=function(t){document.addEventListener("DOMContentLoaded",(function(){document.getElementById("start-test").addEventListener("click",(function(){i.createChoiceTest(t).render()}))}))}})();