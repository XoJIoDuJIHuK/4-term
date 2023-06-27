import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.tsx'
import './index.css'
import {Provider} from 'react-redux';
import rootReducer from "./reducers"
import {createStore} from "redux";

const store = createStore(rootReducer)

ReactDOM.createRoot(document.getElementById('root') as HTMLElement).render(
    <Provider store={store}>
        <App/>
    </Provider>,
)
