export const ADD_TODO:string = 'ADD_TODO';
export const TOGGLE_TODO:string = 'TOGGLE_TODO';
export const SET_VISIBILITY_FILTER:string = 'SET_VISIBILITY_FILTER';

type visibilityFilter = {
    SHOW_ALL:string,
    SHOW_COMPLETED:string,
    SHOW_ACTIVE:string,
}

interface Action {
    type:string;
    text?:string;
    id?:number;
    filter?:string;
}

let nextTodoId = 0;

export const VisibilityFilters:visibilityFilter = {
    SHOW_ALL: 'SHOW_ALL',
    SHOW_COMPLETED: 'SHOW_COMPLETED',
    SHOW_ACTIVE: 'SHOW_ACTIVE',
}

export function addTodo(text:string):Action{
    return {
            type:ADD_TODO,
            id:nextTodoId++,
            text,
    };
}

export function toggleTodo(id:number):Action {
  return { type: TOGGLE_TODO, id};
}

export function setVisibilityFilter(filter:string):Action {
  return { type: SET_VISIBILITY_FILTER, filter };
}
