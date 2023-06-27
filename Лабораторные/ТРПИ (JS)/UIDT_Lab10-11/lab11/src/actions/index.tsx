import jobs from "../reducers/jobs";
import visibilityFilter from "../reducers/visibilityFilter";
import displayedJob from "../reducers/displayedJob";
import stateOfFilter from "../reducers/stateOfFilter";
import stateOfJobsList from "../reducers/stateOfJobsList";
import {Action} from "redux";
import {Tags} from "../Jobs";
import {Grid} from "@mui/material";

type GetActionFilter = (filter: Filter) => ActionFilter
export const setVisibilityFilter: GetActionFilter = (filter) => ({
    type: Actions.SET_VISIBILITY_FILTER,
    filter,
});

type GetActionTag = (filter: Tags) => ActionTag
export const setSelectedTag = (tag) => ({
    type: Actions.SET_FILTER,
    payload: {
        field: Field.Tag,
        value: tag
    }
})

type GetActionVisibilityFilter = (isFavourite: boolean) => ActionVisibilityFilter
export const toggleVisibility: GetActionVisibilityFilter = (isFavourite) => {
    return {
        type: Actions.SET_VISIBILITY_FILTER,
        payload: isFavourite ? VisibilityFilters.SHOW_FAVOURITE : VisibilityFilters.SHOW_ALL,
    };
};

type GetActionNumber = (id: number) => ActionNumber
export const toggleIsFavourite: GetActionNumber = (id) => {
    return {
        type: Actions.TOGGLE_IS_FAVOURITE,
        payload: id,
    }
}

export const selectJob: GetActionNumber = (id) => {
    return {
        type: Actions.SELECT_JOB,
        payload: id,
    }
}

export const enum VisibilityFilters {
    SHOW_ALL = 'SHOW_ALL',
    SHOW_FAVOURITE = 'SHOW_FAVOURITE',
}

export const enum Actions {
    SET_VISIBILITY_FILTER = "SET_VISIBILITY_FILTER",
    TOGGLE_IS_FAVOURITE = "TOGGLE_IS_FAVOURITE",
    SELECT_JOB = "SELECT_JOB",
    SET_FILTER = "SET_FILTER",
    APPLY_FILTER = "APPLY_FILTER",
    UNSELECT_JOB = "UNSELECT_JOB",
}

export const enum Schedule {
    FULL_DAY = "Полный день",
    FLEXIBLE = "Гибкий график",
    REMOTE = "Удалённая работа",
}

export const enum Busyness {
    FULL = "Полная занятость",
    PARTIAL = "Частичная занятость",
    PROJECT = "Проектная работа",
    TRAINEE = "Стажировка",
}

export const enum Experience {
    FIRST = "Нет опыта",
    SECOND = "От 1 года до 3 лет",
    THIRD = "От 3 до 6 лет",
    FOURTH = "Более 6 лет",
}

export const enum Field {
    Location = "Location",
    Schedule = "Schedule",
    Busyness = "Busyness",
    Experience = "Experience",
    Salary = "Salary",
    Tag = "Tag",
}

export type Filter = {
    location: string,
    schedule: Schedule,
    busyness: Busyness,
    experience: Experience,
    salary: number,
    selectedTag: Tags | undefined
}

export interface State {
    allJobs: Job[],
    visibilityFilter: VisibilityFilters,
    displayedJob: number,
    stateOfFilter: Filter,
    stateOfJobsList: Filter,
}

export type Dispatch = (action: Action) => void

export interface ActionNumber {
    type: Actions,
    payload: number
}
export type DispatchNumber = (action: ActionNumber) => void

export interface ActionTag {
    type: Actions,
    payload: Tags
}
export type DispatchTag = (action: ActionTag) => void

export interface ActionBool {
    type: Actions,
    payload: boolean
}
export type DispatchBool = (action: ActionBool) => void

interface FieldWithValue {
    field: Field,
    value: FieldValue
}
export type ActionFilter = {
    type: Actions,
    payload: FieldWithValue | Filter
}

type FieldValue = string | number | Schedule | Busyness | Experience

interface ActionVisibilityFilter {
    type: Actions,
    payload: VisibilityFilters
}