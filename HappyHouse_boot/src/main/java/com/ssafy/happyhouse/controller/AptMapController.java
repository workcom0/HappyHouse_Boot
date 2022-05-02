package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.model.AptInfoDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.service.AptMapService;

@RestController
@RequestMapping("/apt")
@CrossOrigin("*")
public class AptMapController {
	
	private final Logger logger = LoggerFactory.getLogger(AptMapController.class);

	@Autowired
	private AptMapService AptMapService;
	
	@GetMapping("")
	public ModelAndView list(@RequestParam Map<String, String> map) throws Exception {
		ModelAndView mav = new ModelAndView();	
		mav.setViewName("realAPT/apt");
		return mav;
	}
		
	@GetMapping("/sido")
	public ResponseEntity<List<SidoGugunCodeDto>> sido() throws Exception {
		logger.debug("sido : {}", AptMapService.getSido());
		return new ResponseEntity<List<SidoGugunCodeDto>>(AptMapService.getSido(), HttpStatus.OK);
	}
	
	@GetMapping("/gugun")
	public ResponseEntity<List<SidoGugunCodeDto>> gugun(@RequestParam("sido") String sido) throws Exception {
		return new ResponseEntity<List<SidoGugunCodeDto>>(AptMapService.getGugun(sido), HttpStatus.OK);
	}
	
	@GetMapping("/dong")
	public ResponseEntity<List<AptInfoDto>> dong(@RequestParam("gugun") String gugun) throws Exception {
		return new ResponseEntity<List<AptInfoDto>>(AptMapService.getDong(gugun), HttpStatus.OK);
	}
	
	@GetMapping("/apt")
	public ResponseEntity<List<AptInfoDto>> apt(@RequestParam("dong") String dong) throws Exception {
		return new ResponseEntity<List<AptInfoDto>>(AptMapService.getApt(dong), HttpStatus.OK);
	}
	
	@GetMapping("/aptName")
	public ResponseEntity<List<AptInfoDto>> aptName(@RequestParam("dong") String dong, @RequestParam("aptName") String aptName) throws Exception {
		System.out.println(dong);
		System.out.println(aptName);
		
		return new ResponseEntity<List<AptInfoDto>>(AptMapService.getAptName(dong, aptName), HttpStatus.OK);
	}
}
