import React, {useEffect, useState, JSX} from 'react';
import s from "./../styles/JobCard.module.css"
import {images, Tags} from "../Jobs";
import redHeart from "./../images/isFavourite.png"
import grayHeart from "./../images/isNotFavourite.png"
import {Actions, DispatchNumber, DispatchTag} from "../actions";
import FavoriteIcon from '@mui/icons-material/Favorite';
import {Box, IconButton} from "@mui/material";

type JobCardProps = {
    company: Job,
    handleFavouriteButtonClick: DispatchNumber,
    handleSelect: DispatchNumber,
    handleTagSelect: DispatchTag
}
type TJobCard = (prop: JobCardProps) => JSX.Element

export const JobCard: TJobCard = ({company, handleFavouriteButtonClick, handleSelect,
                                      handleTagSelect}) => {
    const getButtonImageSource = (isFavourite: boolean) =>
    {
        return isFavourite ? redHeart : grayHeart
    }
    let iconSource = getButtonImageSource(company.isFavourite);

    useEffect(() => {
        iconSource = getButtonImageSource(company.isFavourite);
    })

    return <Box className={s.jobCard} onClick={() => {
        handleSelect(company.id)
    }}>

        <Box className={s.icon}>
            <img src={images.find(t => t.id === company.id).src} alt={undefined}/>
        </Box>

        <Box className={s.container}>
            <Box className={s.companyName}>{company.companyName}</Box>
            <Box className={s.title}>{company.title}</Box>
            <Box className={s.location}>{company.location}</Box>
        </Box>

        <Box className={s.tags}>{company.tags.map(t => <Box onClick={(e: MouseEvent<HTMLDivElement>) => {
            e.stopPropagation()
            handleTagSelect(t)
        }} key={t} className={s.tag}>{t}</Box>)}</Box>
        <Box className={s.likeButtonWrapper}>
            <FavoriteIcon id={"likeButton"} style={{color: company.isFavourite ? "red" : "gray"}} onClick={(e) => {
                e.stopPropagation()
                handleFavouriteButtonClick(company.id)
            }
            }/>
        </Box>
        <Box className={s.dateWrapper}>
            <Box className={s.date}>{company.date}</Box>
        </Box>

        <Box className={s.indicator}
             style={{
                 background: company.isSelected ? 'blue' : 'white',
             }} ></Box>

    </Box>
}