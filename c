
[1mFrom:[0m /mnt/c/Users/luke_/dev/flatiron/projects/hikable/hikable-api/app/controllers/api/v1/reviews_controller.rb:15 Api::V1::ReviewsController#create:

    [1;34m10[0m: [32mdef[0m [1;34mcreate[0m
    [1;34m11[0m:   @hike = [1;34;4mHike[0m.find(params[[33m:hike_id[0m])
    [1;34m12[0m:   @user = [1;34;4mUser[0m.find_by([35mid[0m: review_params[[33m:user_id[0m])
    [1;34m13[0m:   review = @hike.reviews.build(review_params)
    [1;34m14[0m:   [32mif[0m params[[33m:review[0m][[33m:images[0m].present?
 => [1;34m15[0m:     binding.pry
    [1;34m16[0m:       review.images.attach(params[[33m:review[0m][[33m:images[0m])
    [1;34m17[0m:        [1;34m# params[:review][:images].each{|image| review.attach(image)} # check that this works for one image, if doesnt then add if more than one else just attach one[0m
    [1;34m18[0m:   [32mend[0m
    [1;34m19[0m:   [1;34m# review.name = @user.username[0m
    [1;34m20[0m:   [1;34m# options = { include: [:comments], fields: { comments: {user: [:name]} } }[0m
    [1;34m21[0m:   [32mif[0m review.save
    [1;34m22[0m:     render [35mjson[0m: @hike
    [1;34m23[0m:   [32melse[0m
    [1;34m24[0m:     render [35mjson[0m: review.errors, [35mstatus[0m: [33m:unprocessable_entity[0m
    [1;34m25[0m:   [32mend[0m
    [1;34m26[0m: [32mend[0m

