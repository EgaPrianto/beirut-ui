package com.gdn.x.ui.beirut.service;

import org.springframework.data.domain.Pageable;

import com.gdn.common.web.wrapper.response.GdnBaseRestResponse;
import com.gdn.common.web.wrapper.response.GdnRestListResponse;
import com.gdn.common.web.wrapper.response.GdnRestSingleResponse;
import com.gdn.x.beirut.dto.response.PositionDTOResponse;

public interface BeirutService {
	
	GdnRestListResponse<PositionDTOResponse> getAllPositions(String requestId,
		      String username, Pageable pageable) throws Exception;

}
