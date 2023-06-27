import React from 'react';
import {JobCard} from "./JobCard";
import s from './../styles/JobsList.module.scss'
import {List, ListItem} from "@mui/material";
import {DispatchTag} from "../actions";

type ActionFunc = (id: number) => void
type SJCProps = {
    allJobs: Job[],
    showFavourites: boolean,
    handleFavouriteButtonClick: ActionFunc,
    handleSelect: ActionFunc,
    handleTagSelect: DispatchTag
}
type TSearchJobsComponent = (prop: SJCProps) => JSX.Element

export const SearchJobsComponent: TSearchJobsComponent = ({allJobs, showFavourites,
                                                              handleFavouriteButtonClick,
                                                              handleSelect,
                                                              handleTagSelect}) => {
    let filteredJobs = showFavourites ? allJobs.filter(t => t.isFavourite) : allJobs
    return (<List className={s.jobsList}>
        {
            filteredJobs.map(job => <ListItem key={job.id}><JobCard company={job}
                                             handleFavouriteButtonClick={handleFavouriteButtonClick}
                                             handleSelect={handleSelect}
                                             handleTagSelect={handleTagSelect}/></ListItem>)
        }
    </List>)
}