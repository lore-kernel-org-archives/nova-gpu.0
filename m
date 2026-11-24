Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795544944;
	b=oji/DBuapfcQzE69fOswe/pcWn7C6hNlKpLVYtsg1z6WWjfmAIATyAB2w0HJAeSem6HP
	 +xpfR1fZ1n7qRl5NRVG0n7z05XjA/H9qLwQFrOCC6cR2pQX2PeDpAiovKRSsWpG5UZBf4
	 y/EpM0OQOWYbj5AIR73S9lht0LcLYAQWB/6Nvuv608BvUgW8RCmR1Kszg2hN9X03MrKIH
	 T4rBemFBX7Lzgmj+B6vJt8yj1krwsHebtb0kZgof5TWW364dXG+zm81RUDbkzHNyPUZSj
	 p5YqYMVNC07va7vPu7CfBewwFsShq2yPizmdqoRYnuQeisNtSiqwcm4NJ4TMY12647A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544944;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=wSMuus3dpnlCae5jFe1ORDiKrROleEnsQGjLitLZAAo=;
	b=pdb7bu62FMThRwXSR4ic3UZnUc2XBuC1/xf88NERbtZxuctSXOPu0BEqnbicAvyzPuR+
	 Ei2mqfJEGTZzQEAB3Jfu3i5SDL0NFLvGRIhjgK0fQja5mNGgZmkWmL6A5puJkd04zhA46
	 vEw9fNFhyCFQB4QOVp+RegR/C4vXsLvonsbAuK4eblx4yhIajS8t4xqFBqton7OkcJWnW
	 Ir1AbpYxH8jK0bnWVNwpHaXgDgYHyJaU7oogbHiitAKf3jrEdRB+10eOsnxelosnVwHCr
	 2sDxb5Pmr+kO/nBPic22CLLt4Yewz5o/7hBmIhsPI848rNBWyXCbWudMX0Hm3jBXG0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nFVtwu7+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.42
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011042.outbound.protection.outlook.com [52.101.57.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F77606A31E
	for <nova-gpu@lists.linux.dev>; Tue, 24 Nov 2026 18:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19F77606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nFVtwu7+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lA0Ei+Z/uZ1+sxzHpYdYmpTQGrINDTUFUdtuh7xCx49hYdubHFGl92+6k0EYpWvHH266KBM1iqMqBTusUFwKXXmVNb+D+wzuoEqmsFHwONH1KQzJ3RfDOffndnSyQ6rsjv8wvXuQ8tc+suGZTzFhXSOzlrsig3KAzGyIW8Qw0Q7uiuv2BDnfLInSWYg0gurWa8WrkIgMbQfWXDYr7tjC9TbStClcI8TYavS6HFEVofygEQx+E1/HDwzR+eTZ18OB4bcS50PWeLFLdHZZIjBWPZEjwrrL8JGRk/GtOCSdLQtoUerGJpeaurw9dgrKNESstrSrQHFvpiVw+fu3OKXKxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSMuus3dpnlCae5jFe1ORDiKrROleEnsQGjLitLZAAo=;
 b=kTcui1FNl3Z7/uDJ06H8NwpZIz0ZyWEUuG6JoLtIhP4BX0MKt1pvAblw19e6EPSLPSyFtC80MhARUakZETmpTVqJhXGJWUFbjRicVbHH2/4qodgvAvzRmLsOssCt5gq12aczPbORibHLgiFkaVv3KOf6j5naJKAioziEJ7wXCBDINO+1pr2Ze95xOACQ/VyaEpPo+A6ebc3N87IKzIZrqMgyVMLDZfzyJIaqqLc87UR1ZT4CPmF/KI9RvCmp7dltxp+mw5hrtdQGNFn0gkvqXm9+QmqcE8yceMmDw7uEL8+1nIm/hNBuD91VIhLKTZjKgOR1TTCUKq2sb7bCJfmVVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSMuus3dpnlCae5jFe1ORDiKrROleEnsQGjLitLZAAo=;
 b=nFVtwu7+SHxOZVhzI2UjJNnq+UXylytba+QI/trFEIy+aHkIo6sh8b3OvJY7FwsB9yMR2JC8QQAPj7ViWzmjibKFbBg20Sdr1ekWWlQFF6trwjqtPn19XZHtrHQ5I2BdgvfcMsQRpVNBDO52WjhxUG5Dwy6NQyWRBrA9yvtUS2fBFFUmU4n/MaDUrcRbqIeauNBh2YmviM6kRYRSF1FP9hPzione9WO1qebPF3jzkcyCUShrfOUw4GKj5dL+xc8cQUi6R5ofD6jaD9EIyGt8cCLNA8MVacQa0TnBPoWKsx6FEP2Rpu8HlyR3b11OBnU3LWL155CSzmwQuBaucre9PA==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by SN7PR12MB6958.namprd12.prod.outlook.com (2603:10b6:806:262::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 18:28:56 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%4]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 18:28:55 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, Alexandre Courbot
	<acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Eliot Courtney
	<ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v3 5/7] gpu: nova-core: add TLV versions of WPR heap size
 functions
Thread-Topic: [PATCH v3 5/7] gpu: nova-core: add TLV versions of WPR heap size
 functions
Thread-Index: AQHdeU9ebod4pdl540m6B5Rb08HcCLc8zx6AgADBlQA=
Date: Tue, 24 Nov 2026 18:28:55 +0000
Message-ID: <6925db8d670ab0c1bab5a544e19895c8eeddbe93.camel@nvidia.com>
References: <20261121002847.3358679-1-ttabi@nvidia.com>
	 <20261121002847.3358679-6-ttabi@nvidia.com>
	 <DN38TM2JOCRB.2FWSW6TESHUT4@nvidia.com>
In-Reply-To: <DN38TM2JOCRB.2FWSW6TESHUT4@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|SN7PR12MB6958:EE_
x-ms-office365-filtering-correlation-id: 26c27750-89a2-43e0-ac81-08df4a58cc7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|11063799006|261026121527099003|56012099006|4143699003|261021121427099003|261102123227099003|261009223027099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 4qKQ/ZB466s1qA0I1C7hLyQCsGdqC5idxtemKTpCZSKVDsZ2JFTSDj+zaT3wOKLdyxTW0tJdyZ2nhAXkdTXKjfrLpRHKYaVam/Ur/z3z/c6j9LY+G32/sy6WoxQSY7q4FVkwBlBN1JRW/jYi6n5A7ZWhmm316xXCwf+YfJ65GlPGsbyImXVtpA7K2caGjPTfEnKqbryqW/ihHX9tKf5aCYFEPmqSJoHvfyx3b0DMqUkftt1EsMDdQ0x3g40pcKIn0skH1Zf7DzqmzH3zDpTejk8BS+tAwVFlNOHlgKbCpI3BQIgkbRcmDop+6/+AO1kjkc2I2MbFhwwoR3h5vWM5je8Qn+OqqWIPajvO6QJgudU5kJB6Q95Uu5odNRtaxg6OFIfISoDT4V6JxdagrR1BjAUw4DS2TiqBd87zJqGHCvg71KWstexjOT2jntu/PfEUYZY/8BODpcwEN/lsdcx86VSw6c/nOSCfaJpON4jKvt00psgVSUDtHGmaQM2zBNKQP7XPIWIux8sHalbYNcPe2JMNS7W8BWpMaabRj6ii8/dkF32+zzq6xqHwqscIYMtcjgZFlBPhh3lCrgu2sThEi7pu8P63BFy8ppPnOTyPJ2iAPhEoacL6e9yg3WcvPBVP4NGPtGD/ZqvljYjKFf9S5c3Ax5BAcX7olpTymUptlxX28Lz3hcLW9pYHalNml7loFxeTZ6XOQGTHyqXU5zjZkNcKPYLKvQxV1Bef6btMxrk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(11063799006)(261026121527099003)(56012099006)(4143699003)(261021121427099003)(261102123227099003)(261009223027099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b2s1QStoZ05NRThYQ2dEN3VDOXNrYVlicTZVZmNJME04MWMwYkh6VjhWWmhV?=
 =?utf-8?B?cU0ydEpCNmU4NWRNOWI2VzVKWkZ1M3F6ZmlUMEkxbEV6YTZrWFk0Nk9uY1BT?=
 =?utf-8?B?UGQxZDFEUUI2U3ZTUFk1Z1N1ZkdMSm5TeGduZXUvamg3NFU1ekJrVFcvK2xS?=
 =?utf-8?B?ajVDY1ZyQzE2SmVDaWhDVmc3cUtxSXd2c1VKZ01QNk1IeEVjd0VhOEY4cUJT?=
 =?utf-8?B?UC8rczQ3WlZiMUQxMyt2akd3Tm85MjB2WG93S3dScEdkaVhLdE1lcnNlZG9s?=
 =?utf-8?B?MlltRzNmYTkyV3hocHYyY2p3cDdTdmttUnpXMTlGbFBDUlBLNFdITlhxdEFa?=
 =?utf-8?B?bmliTUpXQjQ4bW9HWkV5UkYvMDVNSkVzNklrVXI0QXJwUzEwdm95QkR5UUw1?=
 =?utf-8?B?UUkzR0lZa3B3Slo5ZzBQZk4ySUkwMUFwTC80QTVwU3dXMjNVTTFTenZnMitp?=
 =?utf-8?B?NGRsaUFqN1pvODdBTE82SFlaM25KZ0ovKzJpQ3hRQWd3U2pFMjlOaytXNU5w?=
 =?utf-8?B?L1YxTnlObHdCL1hOUWhENjlmRnRNc09OKzQ1eTVTTHFzVHlyRURtQkh3NG4z?=
 =?utf-8?B?Q3BOQzRSNXNhd2ZYK24wNjl4NFVmMmIrT2Fjd2ZLcldUeXpTcTRDVWJ5dFJ4?=
 =?utf-8?B?NVhVVTBNN2E2ZEtmb3pWVTNNSmRtYTJWUXczb2grd3FncEh6VUVZbDdwcFdJ?=
 =?utf-8?B?YnpDWWE4K3JUdTZvSFByaGFsR2hKZzdKMEREczhhbzlvVEVTd0QydW5oeGpi?=
 =?utf-8?B?VzlycjYwZ0gyVklEbFdaNHZXbExvMmRNa1RiK1Q2VW44Q1BraEVEUUtDd3hv?=
 =?utf-8?B?SUJQUVljL0Rkc0I3R3IwbVRzVHZjN293UnBOT1o1UHhSZGpSWkwvSUg2M2w1?=
 =?utf-8?B?ZFpxUzd2ZisvMkp2bFRwWTQrS21jVWJjQzNCRm5sek5SM0FhWVEwdGovOGdj?=
 =?utf-8?B?MkFmM2UzT1N4TUpEVXhrd1pYMHQ1clRlakNBc2RhcWxZN3RVOWN0dEJ2S1dL?=
 =?utf-8?B?US9jNXdyc1grREpHN2xHL3FjdjJlWm1iUUFBVHpuVklUS2V0andyVEJOUGJH?=
 =?utf-8?B?b2c4R1JsQW1PQkEvTmFoM1UwK3JzS3F5eFpvbXFsYktYb0JScmZuSzBoZVF1?=
 =?utf-8?B?UXVhcit6WVVxZTMvY01uekRHWWxRc1h3Vml5QSs1dkYzMlFCRlRpUTdMRmRD?=
 =?utf-8?B?U1hwa3ZKamViTnpFME42eTNNUmZWeFVwb0tJTGpRcS9pMnZ6bnMrYVk1L05C?=
 =?utf-8?B?Wk10R292a3IwZFlqSzI2cmxFVCsydTdKWVluQytWTks0ZU4vWlBMMmRmVFlj?=
 =?utf-8?B?MWVyQXAyYTBEeWJoOFZrR2hyai9Cc1RQaFd6M0hSN3pFRjRNdXovcXIxUXdT?=
 =?utf-8?B?b2h1UXlNY3BVZldyL0ZXQytjRGlYSXRMeTVrOGVLUi9UaTNzSWorY1ZLZjhZ?=
 =?utf-8?B?WS95T2hwOEEvV2NOZk1mOGE5MmVraVVlOGJzYy9LM29Da3BmWTN1T1hyK0Fp?=
 =?utf-8?B?WFg3ZnMxUFY4V1NHZTVXU1RaMHE3K1REMkxHNEtrOU8rQmkwdEorR052WFl1?=
 =?utf-8?B?OHJJYzMrYnBhQmMrOWZQT2IxUy9adzlIQnU5OGg0QUVqTEI5eXpKdXRzTDls?=
 =?utf-8?B?dFF0cjRrR1NQSFhFRk9KVER3dTByWmhCeTlIZm5LRWFybDF5eFpVTUV2SDVi?=
 =?utf-8?B?dUVqZDRKY3NjKzVtRnBYRDl2YXNaRjNoNHkydzUrVUc0UGRBQjBlN1ZzRUth?=
 =?utf-8?B?NUt4NDdGWU5ESUdPTlJ2MjQ5eTB1a2lhODhEVUpBOUp6MHpBK3VQMmM5Vktw?=
 =?utf-8?B?T3VoejV2WEZRYlhaTlRrOTBGYjlXT1hteUd3VFhSVytEZ0pVZzhZcWEyYnB4?=
 =?utf-8?B?V0RNbXZYWUs4VkU1a25nQTdnT1RtZWF3c3Z4T2p6Q0g5ZmtuRzRzelU0UUJB?=
 =?utf-8?B?cElxVisyWXNxOTVzSHA5WWN6RS9rTHdNeWdmWHRaTVJobDVpUktvUUlDYnJM?=
 =?utf-8?B?eDJJM0pSTk5HWWZwTXJrdHIvNEY5bll0T01zLzNTMG8vVzZleTRMT3FPd2I0?=
 =?utf-8?B?U0p0R2Z2S2xxejZsbHRzT2F2TmE1TEd1cFB5WG56U25kVzZKQTlTVjJTUW9C?=
 =?utf-8?B?RCtzUHB0WUJYb0JvNDhMNWcxQ0pHOVl2Q0daWkRES0tLN1BkcEp2VmZWY0p4?=
 =?utf-8?B?aVRIN3hEQjEzN3g0YmpPZjRKRTkzY1RXNVpneUN5MXMzeTc3Yi9tQXpkVVJ4?=
 =?utf-8?B?dlZDUVRUWUlKNVdxYjZ1Zzlhd1lISW5GUmRNZ3Bic2JVVlY1L3liN3RDWHR2?=
 =?utf-8?B?RUUyYWZLa05Vb2pFSVIrTkdjTCt4MFM3RHJtckxwTmRlZDlXbGRqZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <115CA9BEC544BC4388B5B67AB1AE059B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN6PR12MB8568.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c27750-89a2-43e0-ac81-08df4a58cc7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 18:28:55.7392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sA5eW1mg+T5HLPGDLdYvvJpOIrKXGzc20W5tMc1GMRCdAsEKmERZpPBDpLyyMyWZUL0fSgkDnb1DgPFJnEtsPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6958

T24gVHVlLCAyMDI2LTExLTI0IGF0IDE1OjU2ICswOTAwLCBFbGlvdCBDb3VydG5leSB3cm90ZToN
Cj4gPiArDQo+ID4gKyAgICAvLy8gUmV0dXJucyB0aGUgV1BSIGhlYXAgc2l6ZSB0byByZXNlcnZl
IHdoZW4gdkdQVSBpcyBlbmFibGVkLg0KPiA+ICsgICAgI1tleHBlY3QodW51c2VkKV0NCj4gPiAr
ICAgIHB1YihjcmF0ZSkgZm4gdmdwdV93cHJfaGVhcF9zaXplKCZzZWxmLCB0b3RhbF92ZnM6IHUx
NikgLT4gUmVzdWx0PHU2ND4gew0KPiA+ICsgICAgICAgIC8vdTY0Ojpmcm9tKGJpbmRpbmdzOjpH
U1BfRldfSEVBUF9TSVpFX1ZHUFVfREVGQVVMVCkNCj4gDQo+IG5pdDogc3RyYXkgY29tbWVudGVk
IG91dCBjb2RlDQoNClRoYW5rcy4NCg0KPiANCj4gPiArICAgICAgICBsZXQgdm1fc2l6ZSA9IHNl
bGYNCj4gPiArICAgICAgICAgICAgLnRsdl9nc3BfZndfaGVhcF9zaXplX3Blcl92bQ0KPiA+ICsg
ICAgICAgICAgICAuY2hlY2tlZF9tdWwodTY0Ojpmcm9tKHRvdGFsX3ZmcykpDQo+ID4gKyAgICAg
ICAgICAgIC5hbmRfdGhlbih8c2l6ZXwgc2l6ZS5hbGlnbl91cChHU1BfSEVBUF9BTElHTk1FTlQp
KQ0KPiA+ICsgICAgICAgICAgICAub2tfb3IoRUlOVkFMKT87DQo+ID4gKw0KPiA+ICsgICAgICAg
IE9rKHNlbGYudGx2X2dzcF9md19oZWFwX2Jhc2Vfc2l6ZV92Z3B1LnNhdHVyYXRpbmdfYWRkKHZt
X3NpemUpKQ0KPiANCj4gbml0OiBwcmV0dHkgZWFzeSB0byBjaGVja2VkX2FkZCBoZXJlIHRvbyBp
bW8NCg0KVWdoLCBJIHRob3VnaHQgSSBjYXVnaHQgYWxsIG9mIHRoZXNlLg0KDQpGWUksIHRoZSBy
ZWFzb24gd2UgdXNlZCBzYXR1cmF0aW5nX2FkZCBpcyBiZWNhdXNlIGFsc28gY2xhbXBlZCBldmVy
eXRoaW5nIHRvIGEgaGFyZC1jb2RlZCByYW5nZS4NCldlIGRvbid0IGRvIHRoYXQgYW55IG1vcmUs
IHNvIGFsbCB0aGVzZSBzYXR1cmF0aW5nX3h4eCBmdW5jdGlvbnMgbmVlZCB0byBiZSBjaGFuZ2Vk
Lg0K
