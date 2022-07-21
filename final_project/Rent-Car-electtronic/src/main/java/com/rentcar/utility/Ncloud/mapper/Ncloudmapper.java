package com.rentcar.utility.Ncloud.mapper;


import com.rentcar.utility.Ncloud.AwsS3;

public interface Ncloudmapper {

    int save(AwsS3 filename);

    AwsS3 read(String idx);

    Boolean delete(String filename);
}
