ggplot(data = mpg) +
  geom_smooth(mapping = aes(x=displ, y=hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x=displ, y=hwy, group = drv, color = drv))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x=displ, y=hwy, group = drv, color=drv),
  show.legend = FALSE
  )
ggplot(data=mpg) +
  geom_point(mapping = aes(x=displ, y=hwy, color=drv)) +
  geom_smooth(mapping = aes(x=displ, y=hwy, color=drv))

ggplot(data=mpg, mapping = aes(x=displ, y=hwy)) +
  geom_smooth() +
  geom_point(mapping = aes(color = class))

ggplot(data=mpg, mapping = aes(x=displ, y=hwy)) +
  geom_point(mapping=aes(color=class)) +
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "compact"), se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = TRUE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(mapping = aes(group = drv), se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, group = drv, color = drv)) +
  geom_point() +
  geom_smooth(se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = drv)) +
  geom_smooth(se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = drv)) +
  geom_smooth(mapping = aes(linetype = drv), se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(size = 4, color = "white") +
  geom_point(aes(color = drv))
             