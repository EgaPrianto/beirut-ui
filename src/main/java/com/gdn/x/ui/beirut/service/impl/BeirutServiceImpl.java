package com.gdn.x.ui.beirut.service.impl;

import org.springframework.data.domain.Pageable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gdn.common.web.wrapper.response.GdnRestListResponse;
import com.gdn.x.beirut.clientsdk.BeirutApiClient;
import com.gdn.x.beirut.dto.response.PositionDTOResponse;
import com.gdn.x.ui.beirut.service.BeirutService;

@Service
public class BeirutServiceImpl implements BeirutService{
	private static final Logger LOG = LoggerFactory.getLogger(BeirutServiceImpl.class);
	
	@Autowired
	private BeirutApiClient beirutApiClient;

	@Override
	public GdnRestListResponse<PositionDTOResponse> getAllPositions(String requestId, String username,
			Pageable pageable) throws Exception {
		GdnRestListResponse<PositionDTOResponse> positionDTOResponses = this.beirutApiClient.getAllPositionByStoreId(requestId, username);
		return positionDTOResponses;
	}

}
