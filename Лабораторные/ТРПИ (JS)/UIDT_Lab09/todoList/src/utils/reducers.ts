import { combineReducers } from "redux";
import { ADD_TODO, SET_VISIBILITY_FILTER, TOGGLE_TODO  } from "./actions";
import { VisibilityFilters } from "./actions";
import {Action} from "../types/actionTypes";
import {Todo} from "../types/todoTypes";

const {SHOW_ALL} = VisibilityFilters;

const initialState = {
    VisibilityFilter: VisibilityFilters.SHOW_ALL, 
    todos:[],
}

function updateVisibilityFilter(state = SHOW_ALL, action:Action){
    switch (action.type){
        case SET_VISIBILITY_FILTER:
            return action.filter;
        default:
            return state;
    }
}

export function updateTodos(state = [], action: Action){
    switch (action.type){
        case ADD_TODO:
            return [ ...state, 
                    {
                        text:action.text,
                        completed:false,
                    }];
        case TOGGLE_TODO: 
            return state.map((todo:Todo ,index) => {
            if(index === action.index){
                return {...todo, completed: !todo.completed}
            }
            return todo;
        });
        default: 
            return state;
    }
}

export const todoApp = combineReducers({
    updateVisibilityFilter,
    updateTodos, 
})