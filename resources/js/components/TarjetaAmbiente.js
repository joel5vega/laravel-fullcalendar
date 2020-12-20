import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import Card from "@material-ui/core/Card";
import CardActionArea from "@material-ui/core/CardActionArea";
import CardActions from "@material-ui/core/CardActions";
import CardContent from "@material-ui/core/CardContent";
import CardMedia from "@material-ui/core/CardMedia";
import Button from "@material-ui/core/Button";
import Typography from "@material-ui/core/Typography";
import aula from "../images/aula.svg";
import laboratorio from "../images/labo.svg";

const useStyles = makeStyles({
  root: {
    maxWidth: 150,
    minWidth: 20,
  },
});

export default function ImgMediaCard(props) {
  const classes = useStyles();
  const { nombre, tipo, capacidad } = props;
  const size = capacidad / 5;
  return (
    <Card className={classes.root}>
      <CardActionArea>
        <CardContent>
          <Typography gutterBottom variant="body1" component="p" width="50">
            {nombre}
          </Typography>
          <Typography
            variant="body2"
            color="textSecondary"
            component="p"
            width="30"
          >
            {tipo}
          </Typography>
          <Typography
            variant="caption"
            color="inherit"
            component="p"
            width="30"
          >
            {capacidad}
          </Typography>
        </CardContent>
      </CardActionArea>
      <CardActions>
        <Button size="large" color="primary" >
          {capacidad}
        </Button>
      </CardActions>
    </Card>
  );
}
