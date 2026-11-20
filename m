Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795159680;
	b=1qngwfDSSzwR3E0iWhvPfO6ZiIc6kQ/oihdpYQh7hyDaWrvsVhF9wg9Chu0k2EQnMxoE
	 hi4XZKgEHNu8bYulp11mhqAmf7nMPdXB2QyhMlzkecB/Ouop4xPiA1xESU1X1sGixqhYR
	 ylJjnhEf8JbOqz/TCgexEZWMQy9cFyDzHX8iX3d/cbDfTnDbAGl0E2PdvxwObpge6N09Q
	 ZhSWyiOmicpK9VKLGnXnKn4/DEuYSq2baOrAE9lJbgDaXwT4stztvJKfLYjh9N7igmJhj
	 atkzKYXg8jnBxbpp325qbN+CRL4yq8uxIvkUNb9zNVjGH18yJceGD2RBbidmwYbZjeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795159680;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=08/1/Gzx/CLZxqlbRVc43B1hfo5csJJfVBWMB9//Jik=;
	b=42ZHBKpyd41j6HzIZWGfA1IzsC3BsVucXK5wt+W31ta0YT0aSy+gUqDoNejWwICD/MJE
	 wdONa5G0SzOXErnIav6ngrnuf1kRmEaHJtnExUAPiRSS2IoWOf/gt55DkIogdYydbe21H
	 3pVG3YgKp2vy3BEZN1k59pN2OVABAzw9CR2FUJLPpxKUpFPF77pU4oke6fJ2dpCZWvV5E
	 0wVj5lT0KN51/qEeDJGbND7POSbEoP4KxrychLRkRr5guq2hJv2kHDW2Hj1uRpQ80sJ+1
	 O623g2bzXcQkmDMM3J1yiVzCXY2ASPyruTt+xuTwsZ9XEHe1FqlZkCp03Q87z5c/jhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FVii1UPF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.23
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011023.outbound.protection.outlook.com [52.101.52.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B4D606A320
	for <nova-gpu@lists.linux.dev>; Fri, 20 Nov 2026 07:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84B4D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FVii1UPF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcNa/ay5yXrcTpjnBm7BvyCTYWf+6fg2ym4705m8IFbuBfDz3WkcL3XegiMy2rrPLavNgLNAQj+wYqzuXcaqCXmH8ddQgk46GDkHkPZXZ33FH1E77ncDSphZXdaqL8v06y04/gskABLWCrKQF07WY/h70t5nKZxj1I71cLyRY38Bd9nmNYN5pjd2cY7h2wvGCPZyJTwiEIMgiItPPGPygmQTD6Kf2RuvwdCzf+4jw/RtJwR2DGN2A6ZUzB+Y9MZlCOr661RWLdkL3/whYI/i0WSK+GQMEJ+2iLNdudXeZb/8ZmKPEQD26m7gSOyvM6ScVrenVxTXct9MGYHsiug+4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08/1/Gzx/CLZxqlbRVc43B1hfo5csJJfVBWMB9//Jik=;
 b=DuUMTNHUJSJBmNMHdzMzfVPYrWj1beGFrg0gIVRZ6ubFXcU0PwSnVV0ha6wMPjOX+kYoexr97i8wf+/QcT8shoe2zoFrz6+wge9SE/IfmPsh4ytRbfj7mlzKFlUaZ7C23dk5IuE+TfFDUMutV1/dyJx1A8/klOgoMHiPokBDyUJGjROuSNubB5dvrkNqYvDuhZiLAxmQkyelandn4KG+3DJ5KY1Tx6+L8CIPZfXalk2/5NoKFrRrt8ZA3P2zpbauMGcdcyRBRwg6rivj/98QZxDPR/QaOebyzd/V4oH0bRlMtwc3PU0/bVMqtAE1idXgKDVPoN226RIAyiocyuj6zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08/1/Gzx/CLZxqlbRVc43B1hfo5csJJfVBWMB9//Jik=;
 b=FVii1UPFGG4yEqlh0X2/LACZjfRx4N1iSfObRS3BMpsv/Ur2pZ+pvN5cxjGuh9zL8lROS/npvn739SgFr2sPWLrQkv3AD2S0Sj9nkS4dhynx+hiZnXXMgspL75s8pkzwaWX9S7zftEaR0p0fyElMGMNA7M8s4phTCCEOrMqUB0jcTdY/y/GEURSqcOva+S4ngJYdJie90jvYtuTUlvjXOgyrCb0Do8SETocdAXa3cz2lM+JcttAQdM6VWkuc7l2xqwbZ2JZmci4NB0dKCyNjMMxVYbqOUpNcpoNd2JsiUobtRYfPr0v9fddNhK3IPPheoCGhk79QdJJsvJ81BYNPMQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 CH1PR12MB9648.namprd12.prod.outlook.com (2603:10b6:610:2b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 07:27:51 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 07:27:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 16:27:47 +0900
Message-Id: <DMZUZQDAUGRK.KZZUQGL3K7FH@nvidia.com>
Subject: Re: [PATCH v2 6/7] gpu: nova-core: change wpr2_heap_params to use
 TLV values
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nova-gpu@lists.linux.dev>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261116195441.940595-1-ttabi@nvidia.com>
 <20261116195441.940595-7-ttabi@nvidia.com>
In-Reply-To: <20261116195441.940595-7-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0173.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::16) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|CH1PR12MB9648:EE_
X-MS-Office365-Filtering-Correlation-Id: 74770fff-347b-415d-a8e8-08df46d7c8a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|23010399003|366016|1800799024|10067099003|4143699003|11063799006|56012099006|261021121427099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	gkBbe8HRD+CX2GvXu0nga4drsM+x7j5PwU73+UgIaEwnz5JrsPhiHr23QicAhCfexWHkhWBFwtSBcfBRlTC9nLmJTn3fMsKo2lQCCbC27O2dhJ7tj8ow10VqsYFQhXvCt6CrDVU9pRHJfZNeYlRUOLUEJL8MJ35IQ5gYamPlg5mh3mwZlRedUpmkmpkJrlyEyfWkVPr7SG4W4Moq5aI54F+4uijOfv05T9KsYIJhiiC0/Zc3bAW9aBbPUc309mss74UviK9xW3T1ebcjB25uY+msovyqqvYHZ2sQevdIfhvI2MQiAwsV5mA5BrZBeVilNGgpsXjHZpRxuKIZgbtV0zPIzefHvRoynLoVdLuk+AVwce0h3e+0h08ax2VNM+3v+8IJKPnWsLKx3Rwjb/wzncvunKh7lkgF7bHWM8j3OyXXwztiXsCt8s91DgmAtfYqXoi35E1AyW7LYtPwcpFqtTpzXQw+jXd5qHPCkzT0SLqi6Bh7eNJEVuI1oq3sl+Cv3m5Z3sAkg/+CRyTMwchDXLGW169VuWW6aoYWLuY/uT4XjKrI8HfY2YBZuC+nVEUElrlhyEyTFNH3M+usz5hALYGSp2IxmfAIWLYZR9g49cLLJL5ZDLC4vulChRzEhcGu/1A21JyA5Ha3e4Z+oLsAzDbUwk9kd8x0eGwTbf4LbAQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(23010399003)(366016)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261102123227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blB4cTUzdmVSbE5CSVJTUk9qL2d4bHBucm5YbmhOSS9TL1hmSlZkbm01Z0lD?=
 =?utf-8?B?QXhpTzF5NFg2UG14YjB0bGNYV3Z0VC9kbzAySTNPcHQ2L28wc0JlSERTNlY4?=
 =?utf-8?B?eE03RlhNVkUvRjF4QVFkRk9RVEJiV2xzM0QvQnF1K0pJRU01VDAzTFpTaU5R?=
 =?utf-8?B?dm4yb3EzK1dWZGpUTS9mTDdnb2REUVlBV3YzWTZoU05OVld1Mlp2S01pRG5n?=
 =?utf-8?B?RlB5Z2tDMVlYNk54SlY3L3NwK2N5cVVtRG5pdEFGS0w0am1TTndYUjVyZmpL?=
 =?utf-8?B?VU9GS3lhWU9EeG94Z1ZsMjNMMFlpTGJxRGZaRnlZS0xobE9CNVdHN1lvcWpl?=
 =?utf-8?B?T0dEMkRtejBEZkVNOStoY0dWdkR6QisyUlNQWFh3OTZkL1BEQ2dyQlNMZGxJ?=
 =?utf-8?B?NUZqaG02WGNDL29TSEtyVGlJYnAyN0dQSTlHMkJyZHdmVUVDODEvaHpMVGwr?=
 =?utf-8?B?TElkeEV4UnVwd3cyQ3ZqV0M2ZHpNSDdkSmx6dGlJVDh3OXlyUi8zWGw1dnZ3?=
 =?utf-8?B?TS9yak5vNnJlLzNEY1JGbS9wUVlOQkNmalI5NHFReU4yOUhCbFM5VWZLSy83?=
 =?utf-8?B?alczbDZFbWp3NGVkL0psMDNPN3hFOXhKZGF2aW5zTVdDai9nY0hIbkJrY0Fv?=
 =?utf-8?B?cWR3bDlJVGI4WE1NYldpL2xZRklOWU4wemp3RWJEc3NYSEU5R0JXYkk0QmQ5?=
 =?utf-8?B?OFJWRGxNamtWZVNhSW40V2YxL3pOL2hkenMxbnh6SUpBT0pYdGtUWXh2Yldo?=
 =?utf-8?B?cURmaEU3ekMvSjlFaUFDVUZzRENKVXJvcjBsMjBOcllpMTY3RHVwNFVweldp?=
 =?utf-8?B?NHVTR2NVbytMb3NNOS8rUXRXVllHUmJBZkhLRzNxTFNuUkoyNW5UT3JKem1h?=
 =?utf-8?B?aXJHNjJhTVBHN2FVZFdtT0wwZXJ4VUNvOTRURnM5VklYSGdLclRLcHNkNnRP?=
 =?utf-8?B?ajRiNE1FTW5hc3lFTytWbTRDblNCY1hHMnVMbHA3QkFTbHBlN2tpa0lJSlVB?=
 =?utf-8?B?U05hZGd6clMwdEJEa0E0RitvNk5pR3I4RmxZQTR5QkRzcHZHL2xxejVCemU0?=
 =?utf-8?B?SWFPUHRmNDZFKzMrVkhMRnNxa2Q5RHRobm00OEhDNUtNSW01NXg0U0V2Z3c4?=
 =?utf-8?B?MEFPek9BY0src3pPSXBEN2NxZTJDQ0dhVExVT3hkRzc5V0x3QzQ1WjVFL3Ez?=
 =?utf-8?B?MUZ4L1BVTjRjbE9ueWV6Mi9ON2pEM2lMVS9Od1IxckRlbGNlRTFyWTE3Mksw?=
 =?utf-8?B?citOQmdpMHhYU3hLU05zOXR3cnhZZlFnclo3ZTl6enZmK0RWUTBZMXd4b205?=
 =?utf-8?B?Q3FQcThRMU5FMjU4M3FDZTBBdTZVQ1hiWThsSDFoTFhjY0ZnTDc4ZzR4L2Vw?=
 =?utf-8?B?NkFQRXVWTW9xZ0o5bTY0eENkWUJnOXhlK0pFNE8wM3IwdXRUT0F5b2I3NGRn?=
 =?utf-8?B?cW4rd2YrdVlJYzRQYkh1bFZPaDdKS1pjZ1h0aTNqZFozVGFBME5QZjdiczBw?=
 =?utf-8?B?aEsvaFBkemlNTkQ5Z1Bvdys5Q2NUWVNyRWRCeHUrRGZuZnVNU1VzYnhkZzY5?=
 =?utf-8?B?L1h4NDQ3ZzZkckl3UFBnT0FSSkcwRmM5UHhrRjlGZGx3NW1jcjdiaTRSTHRG?=
 =?utf-8?B?eVBDWUNsY2srZ2dQSlZuN0FxcjJJZ0NmRjBVT2RoWGdWMThocGg3ZHFZa3Uy?=
 =?utf-8?B?bVh6Wi8wam1jeGdSTnZNNWlaQWlCZ0E2YWhYcjZYY2t2K2U0c2Ezc1F5bFA0?=
 =?utf-8?B?aG1NVmVqZ0tjeENnQ21BYlVyUjBJS3ltZUJWT2FUWVE5VUN0VEpZOC9LNDVr?=
 =?utf-8?B?a2c5L2pTcmRmWDZtbW8wWTBjbk5iRGxqZDEvb2UzdW9UaTR2cENHNnFUZWNa?=
 =?utf-8?B?U0VCcldCVzhSMXZ5QW5tc2M1b21pRTI3WFIrczZVbVFaNVJpbU1vUEJJVDVE?=
 =?utf-8?B?TlE4QTBjeVZ3eFEzNDdMZithZllQelJqR1VaNWdWclhqN0tMa1FvOXBHTGhq?=
 =?utf-8?B?MmtWcW5yakRPd204Wk05YUhMeEVtNVFLZG5zekNCTVg1bjN2TG03ODRBaTFx?=
 =?utf-8?B?SnEyVkNXbWZudXRxYWMzTm1ZMnQ1NlhkYjY0a2V4T1ovbEhNU0RMTE9BQkFC?=
 =?utf-8?B?TDhrVk9lU2hCekNTRXRkUTJNRzU1WCt3ZTQ1TDJHVUlpejM4bFEraFRpbThv?=
 =?utf-8?B?V05JbUMveWRDQUxkTVk5cFpyVkZCVittbDA2bzFzWERBeFJoUmVpdk83MFRU?=
 =?utf-8?B?a2E5aFBjUHVEMFVock9pZGVvMU0rd3J5b2FZYXVOakp3YUlTVFhEWjZsNUF1?=
 =?utf-8?B?QTNwTEpWYlNHSFhXQktJYmpERUhxRlRDYXA5T0lNdjVSSDViWGdySytVZll3?=
 =?utf-8?Q?m/f52TrMwnT5H5ooyYm0je4tr9BmdCb2j2f2r6x1nFqvf?=
X-MS-Exchange-AntiSpam-MessageData-1: 3yio7KZKiJF8qw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74770fff-347b-415d-a8e8-08df46d7c8a5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 07:27:50.9572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KXD9owN/d3WBTjnOdt/1Pp7BRW/kl2MQP7N1YMYR7JqZViGG9tJcVrkOnU11z25nXKzjAeqrSfCkYbRkAPw9AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9648

On Tue Nov 17, 2026 at 4:54 AM JST, Timur Tabi wrote:
> Now that GspFwHeapParams has TLV-based implementations of wpr_heap_size()
> and vgpu_wpr_heap_size(), change wpr2_heap_params() to use those
> functions instead of the LibosParams versions.  This renders LibosParams
> unused, and it is marked as such.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
