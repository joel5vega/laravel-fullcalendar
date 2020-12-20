import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import Card from "@material-ui/core/Card";
import CardActionArea from "@material-ui/core/CardActionArea";
import CardActions from "@material-ui/core/CardActions";
import CardContent from "@material-ui/core/CardContent";
import CardMedia from "@material-ui/core/CardMedia";
import Button from "@material-ui/core/Button";
import Typography from "@material-ui/core/Typography";
import avatar from "../images/avatar.svg";

const useStyles = makeStyles({
  root: {
    maxWidth: 150,
    minWidth: 100
  },
});

export default function ImgMediaCard(props) {
  const classes = useStyles();
  const { titulo, apellido, puesto, estado } = props;
  return (
    <Card className={classes.root}>
      <CardActionArea>
        <CardMedia
          component="img"
          alt="Contemplative Reptile"
          width="120"
          image={avatar}
          title="Contemplative Reptile"
        />
        <CardContent>
          <Typography gutterBottom variant="body1" component="p"width="50">
            {titulo} {apellido}
          </Typography>
          <Typography variant="body2" color="textSecondary" component="p" widht="30">
            {puesto}
          </Typography>
        </CardContent>
      </CardActionArea>
      <CardActions>
        <Button size="small" color="primary">
          {estado}
        </Button>
      </CardActions>
    </Card>
  );
}
