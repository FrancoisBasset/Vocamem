import './assets/main.css';

import { createApp } from 'vue';
import { createPinia } from 'pinia';

import App from './App.vue';
import router from './router';

import Neutralino from '@neutralinojs/lib';

const app = createApp(App);

app.use(createPinia());
app.use(router);

app.mount('#app');

Neutralino.init();
Neutralino.events.on('windowClose', () => {
	Neutralino.app.killProcess();
});
window.addEventListener('contextmenu', e => {
	e.preventDefault();
});
