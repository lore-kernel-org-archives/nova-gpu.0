Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794629427;
	b=SC1QPNqY5kqZPJEiog0/Shs82nPxe5kt61nnxiACMntQ2X9jrpmqESI0YaNKlZ0m7GPk
	 Poj3hS6ZEXdthZhe/NJbBVe8tK//q+7KouVFc4hfLiXX7WG7a8om+kl2N4/Z68mXqVAzN
	 IPoOeIZ3LnYY8z1fF0sqhxFnOdWUyC1wTnLAWVvGDBiAZ8hj9fTMvVQs8oRITNhd2/Zg+
	 EVen5LXlz627FxqIiQPi964kuHFNMD7BxOw9y8v5apas1i16712G6DP4EaswtMxZcM2ft
	 zX2oqKW8E2qzVBkg1CiKnaeWCb7YWh7OJ15MPrlJvJpoczQFRm9vBrVQ2evD08ShvZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794629427;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:
	 x-ms-exchange-antispam-messagedata-1:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=YmMa1knCiHDB9Rsrj50WmJOzuCW+j8hzzmMWcK6XWuw=;
	b=4zj3SAx65Wp+1AArKBru4F+j5/K6FWguTG4UBU8iyHB5qP/BwflDdvJAIJnHUBHxFI3O
	 kvOu7GGgq+W9VEkSq53uPYFVF2D61KtUX2w87+323VHqi44gtZ592ssnjEQ+bHf4J7ajO
	 fJnwea5ODD1UxGY3rOqcnOCIDF6ZLmwA8ka3uJ0hEufJW30iDUZPjPe4Ydci6nPTLs954
	 RJc/IGl0yPLdbnTMCprM0U1+WdRBPto1c7u8wEPNSa+1bxXsGoW8eBGqSMgfzllxfkrie
	 5ct8hFvHgLah7QLl8euWvnfIHl+ad7z4cDWAMcq5wo6I54bOv1uwwURW88CXh/p7nVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ovRBlFa2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.10
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012010.outbound.protection.outlook.com [40.93.195.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189F7606A323
	for <nova-gpu@lists.linux.dev>; Sat, 14 Nov 2026 04:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 189F7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ovRBlFa2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ayRLVMZnxRjFqLeGRqjEUxXuQFTyIWa3kTuGL0/fFjeAN/lZf6zJVvYYHhS9jK26Lcz2NqJI4/6+Ogv1ZUMSjO71Mv6vDC476Pg6fJLnN3oHLwThoKRvQ9vPLNGGY1UD5rdPGAl756+5wApnALnqut2xvB3nP3wiO5Lc6s9cixvVCiTmnaxnelKnQqsbYPMJNuKwcGmNnUURPVXveC8A3Mm6T4MI5sCem69ZJ8Rhjf//vfiXzwSfA72L4VTzZxlwWQ3AkDjLggiUwNkS0B/LvoQki48OpcexWnbY64nhqOsPd8aGLwwU7zRqpiRoaOF+DM5XqwYBuPCVJxoA5OLI5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmMa1knCiHDB9Rsrj50WmJOzuCW+j8hzzmMWcK6XWuw=;
 b=KgY/Gtk2fGU/A3AXoGgpr4FlgLyWQ6QhY19LrmLfM0Jj9JRVH8uXi9Ta6ljSvawMPmCDBY5nRvlmqAZZiRLX7GJ4AeJZfJMYibF5qbgUnkRLshasKAtC/+qRjXHrC/1RfzD2eRxr0MKrOEjuHo/s799RCC2yzeSwjhC5NviAajfSnWbPYTjiH/phkkNNQu6XbdpgAveyGNM96Pg6lFDAXBizR8ZUiuwIwwM/FjNXJh4KEN7XIw9N62AYZd38tFC8VEG+wQ5xviQlSlBuEsOjov3J6SlQRWSk4Pf/s4uy63LK+17eTP6zhUFLQaNwu1PcDL5AwD42VVQSm8b4Gh/sfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmMa1knCiHDB9Rsrj50WmJOzuCW+j8hzzmMWcK6XWuw=;
 b=ovRBlFa2ndkImPbZAsWwSMY30UP0MCGKmaYKTXduqX8KQMCXCazE2pRgSBDwqtgnAil44i+68zkmi308tWYLDqen92lwmyhIepGMUWJ0JpsPNH+OxIREU5uDZWrAo9817qruZATpT765ENNRKES5i6/oFc/Ex+AgFL9xhS0XFZFH9UKVWWTRisP0gjMCZXafM4OOwp/db9tlirMp1zik1mxsH4zZpP7m6kru0I0xEBvU8BAkwDaHq0EGNyIVNTrYj6eww4h+VPMP4IF8VHDR1scdUvELfwBIHHXQ4WBM3ZcjHxcVJC1RlkP9zdV+eVFE2lc6X6zpK5a6Ic+WqnuEOw==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by IA1PR12MB8586.namprd12.prod.outlook.com (2603:10b6:208:44e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Sat, 14 Nov
 2026 04:09:23 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%4]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 04:09:23 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, Alexandre Courbot
	<acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Eliot Courtney
	<ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 2/5] gpu: nova-core: merge LibosParams into
 GspFwHeapParams
Thread-Topic: [PATCH 2/5] gpu: nova-core: merge LibosParams into
 GspFwHeapParams
Thread-Index: AQHdcWjQP8Ys71Oax0e0YwEwtYriRbcoaXIAgASPloA=
Date: Sat, 14 Nov 2026 04:09:22 +0000
Message-ID: <98758da2d21737964536bfb73fa3e21db8558995.camel@nvidia.com>
References: <20261110231053.1352163-1-ttabi@nvidia.com>
	 <20261110231053.1352163-3-ttabi@nvidia.com>
	 <DMS64VZKSLOP.2RCSK9BCHD47C@nvidia.com>
In-Reply-To: <DMS64VZKSLOP.2RCSK9BCHD47C@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|IA1PR12MB8586:EE_
x-ms-office365-filtering-correlation-id: a96c2ae1-ccb3-408f-0843-08df42051075
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|10070799003|1800799024|23010399003|376014|4143699003|38070700021|11063799006|10067099003|56012099006|261026121527099003|261022075727099003|261102123227099003|261021121427099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 HkF6HZL9MBWIA1rAWwD7LqcE1KK+4O4w1PaMSct0KYEwpjYuOzx38WbtC89xJxXLue3/IyC2xlxVak3DCn73GNc048zpOtyHKhreEcx1mRsLfuMHq4O4B4mtILSlYFbynKzbTrYBk6dWp2chRt1UrCdYBGNZy2jMO93oUmyqd8AwqRB1HBee0I+5XnwBSEEsRQIt4mOvCVI9+lXIm5681s5h38kPGuX3E0oqSZ+Ove6RV7qxbcG6+l+Fry9LKkVrjKDn2XBHyKFPMKnhpbnvVIJp27aUe2JOgKTj3ma9alumfeKVdYYVkruu3tE8sB4KyRnpVhPlr1zBprUUNKqS9+jD9o/Lwx++IDE+Cs1TgArQ1n6gYY6qABrTggpLMzypQ23rHzz5yzITWszYi42xCf4zgc6Py/ZnEZeVHznq66Ds045ykDeDlUeiOGGribkMBPxbtN55Hb9QtJ26OLbyLC2NeExxV/oH3g6Qkp8ywBE7+tYDXBiXfrx1scmXVjoXDUwhW/MXVi13FND0Ud0o+MEIfflI8jDvlyP2Xa0/jQK3Wmk0SzeloMU2KJ0fg4jESSnmTrFLhOu0RX/Bds4Dv6LA6qP79XYh2vjNudaaPgtze30BOe9pTCrzt4Z+Pt8pNSv2EL4vzqwSdWVpev3ssgpTfyJ56cWZVRTPHHhV8T3nA5ND4DENLxLeuEmJClFXF7gVSNXGeHP2n6M1tRppVauTO9oPVNUiEpOnLEqRBpA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(23010399003)(376014)(4143699003)(38070700021)(11063799006)(10067099003)(56012099006)(261026121527099003)(261022075727099003)(261102123227099003)(261021121427099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q1dTRDRsNHJlRkF0RkhSNGJ2emNyaktNQWpMbmd2Z2xrM1Qvc3NkYnl4S1N2?=
 =?utf-8?B?cTBxZzJFMDM3em1YdTVyZXR5MDVvbUptK2ROTnRBNjlwSTJUUHltL3BYTGJj?=
 =?utf-8?B?RDhQVGpnemFoL2ZLU244OHlYS1Y0NnM1dHZrTnl1WGNhMmorbDc5by8xZkZF?=
 =?utf-8?B?TTA1RE9RTSswcmlLSDBMYjRSOUZsWkxQTk1EQnBCMjF3c0gyWTlQcFhBZ1pQ?=
 =?utf-8?B?M1Jtdyt3NzQ1ektlN1lNcDNnRTFSTWRaMW1rMzJsdkl4UHhmMHVaMVFvTVVO?=
 =?utf-8?B?bW5BSkVOTEo3djlmVXYwaVI3MnF4dS80VXRiY2hpa0xPZU9pKzUyWEx6bkti?=
 =?utf-8?B?S2N5cDJxcVlXMEdKb2l0ZENQVVdQcVVaL1MvTThEbDZxcTUybnFEeWhvUXIr?=
 =?utf-8?B?Q01kek1ZUWtCajlra3k3QWZva0NMdy9MQWx5SnRiQW9EWXN1b3ltSU9ZalJV?=
 =?utf-8?B?ME5aUVN1NHk4T3NsY2FmL2RNdjQ1T0M2QUs0Mkc3Q2RBZ0k3bk5ybVJacnNX?=
 =?utf-8?B?S3h5VDZ1Ym0rTGp6RGJZL28rRUU1d3I1bXdjWTdTdWRZUFd3S0YwQnZmL1Zh?=
 =?utf-8?B?R3Y0N3Z6T1dVV3ZON1BLcEJYQzYxQlp5QzFzUC95V2JQMTJKZnRhUWlCbUUy?=
 =?utf-8?B?YWhBbExGMThKanRpRDloY0ltRGhLbjhTRVFRVzZhazFlTW1UL243UkpLMkQv?=
 =?utf-8?B?d0phMXB1R1l2MEpBNDB3Z25rdUN6K0x1UE5TWjA4OXVPSWVVdEtkSEV2dXJt?=
 =?utf-8?B?N29vU1NtS1ptbExyekFxRVNHdjZhOGxOdTlrVitIQnVmNmJJTWZqa3N5ZTd3?=
 =?utf-8?B?RXUwZWpTSktEdWFXTG1RM2dnWE5DTVFuNC9zTWZ5TThuaGRFU3NDN0VRWmxv?=
 =?utf-8?B?cHdhN1psSzFXZitTY0hMMUFJOXBSRUVvbDIrKzNZcXJNczVaOGpKd1htNGsv?=
 =?utf-8?B?d2NyYzREVnIycXR2RmlYYm1VSXZoazUyd1VvdUh0MzN6WmtlN29qdWt4a3VG?=
 =?utf-8?B?T3Q4VlorN2RXaGpiZmtSNE52ZE1sazBmaFNXR09rcDBEdWRFZ3BCL05vaWFy?=
 =?utf-8?B?d0ZWNjNOMmRBanAwUldJaHM4TmpuVDd5S3Rlbk1zVEhtL2dGcUpMb09ZRWJj?=
 =?utf-8?B?VjRYdFZoZ1hhNHBIZjBwVnJySTVCWWpxRFEzamtCb2JpQnY5R1BTM0tNOFMx?=
 =?utf-8?B?QmZKQWJjZHVISXcvRGlNNFhucWFIM3hPSWYxaWtUcXptWXVjaVVjVi85ZVBx?=
 =?utf-8?B?SWx1aWRzeURLNHlHdzFKVzYxT0djSytSaWFRam85bEpzLzhJS1VlcjBURHM5?=
 =?utf-8?B?WlBVRzRGTm5lcjdhcUUyZy9lMi9KMkRTQVhma0s0MzBDcHdLNkNyVUtncGxp?=
 =?utf-8?B?c3dKd0FjMmlGS2s4bWYyN0IzcjhhcVhNMFphcEJFYzlUM01DT3lwaTd2cGlp?=
 =?utf-8?B?aUNuVGszTml6SU9OOG1LaVFwNCt5UEJWSmRxY0Y0UFkzTGVGcDhTbkYwcXhN?=
 =?utf-8?B?NHpPZWF2VGpSRXRyd1lBUGVYaDc3emNEZGM2ZFVXU2RpVVZFR3lqNlpsOGVh?=
 =?utf-8?B?Q2lWVkg4WW5DZVJPTnpPMEsyTWVSV1lmR2RiVXdWNVhlaHdraVdtU2ZHeEx0?=
 =?utf-8?B?Q2JtNzk1QVlJK1hGZVFLazQ0emNNV1FudVMvdk9QVlAvLzVwU09YTzROVFB3?=
 =?utf-8?B?cGdpL2swVTQzOE13akZac2hBeXNNbWxaclIwQkZNMG1CaHZta2FWVnd3MVpj?=
 =?utf-8?B?UFplZWdNYllFVkp4aFVLcm81Z0xpR3lqdFM5aGV3VGNzRFZhUE5OOUxZL1NM?=
 =?utf-8?B?cThDUEh2MjJuZjBhYWFxYnU1RUorVVl4VURxM2JKd3FYQmtYQlh1bk9qbE5h?=
 =?utf-8?B?KzJIZVFJM2ZqTU9aSDk5R0dRRitNdzJBbkNweE9HMmJxcGlEMGNZMjl3UExl?=
 =?utf-8?B?aU1Xc3hLZ09GY1gweGlUV3lDTm9wU0liVEJjdXVtUGd2VUYweDVqcjFvUWxu?=
 =?utf-8?B?dENvc0x6QWpQdU1rRjV4SGNDclJwSXd1bHI1YW9uV0dzMTFFM3dEa2VnSjNI?=
 =?utf-8?B?cDcrQW5KWWU0eWhSdzBCbUcxSFg4V0ZDMnU5VkUxekJsaXloeXBMbklkeDd0?=
 =?utf-8?B?b3hVU3ZydGZPcS92bWg1UG1nZG40S2I4TkdlZk85NlFicjZObFhoY2lyNlBW?=
 =?utf-8?B?cjdFK1RXcWgwdFJ0VTZ0R2hCanhaMU5heXZhWlRkcU9kRnplKzVkODFLWWJl?=
 =?utf-8?B?SW4yNWlHZmo5QTVVcmNORTJWdGZ1bEZOMmpGam1ZUUxkSXUzWkhvQ2Ftb044?=
 =?utf-8?B?ci9YaUN0LzQ4RWd0b0NPYXp0QXRTY1NZRmJPUXNkWC93SUFiQmFmWUNIbHl3?=
 =?utf-8?Q?gvZ/rlJbPreSi9NT5FTRCh58ZxrzM/LPhmMKurcR4VLjd?=
x-ms-exchange-antispam-messagedata-1: gWx45Jgr86kyTg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A84BB153D0B294487C2003779E2688B@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a96c2ae1-ccb3-408f-0843-08df42051075
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2026 04:09:22.8229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JR8k3sN0nphnDD6nyNVoJg2Vb7YRT2rPUt2Agxm4gq9rruhByb18ERykoW0EygoxNBfqvQXhKLv2cgRhF328DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8586

T24gV2VkLCAyMDI2LTExLTExIGF0IDE1OjMwICswOTAwLCBFbGlvdCBDb3VydG5leSB3cm90ZToN
Cj4gVGhlIGRpcmVjdGlvbiBvZiB0aGlzIHNlcmllcyBsb29rcyBnb29kIHRvIG1lLCBidXQgSSB0
aGluayB0aGVyZSdzIHNvbWUNCj4gdW5uZWNlc3NhcnkgY2h1cm4gZnJvbSBtb3ZpbmcgdGhlIGZ1
bmN0aW9ucyBmcm9tIExpYm9zUGFyYW1zIG5vdywgcmF0aGVyDQo+IHRoYW4gc3dpdGNoaW5nIG92
ZXIgYWZ0ZXIgYWRkaW5nIHRoZSBUTFYgdmFsdWVzIHRvIEdzcEZ3SGVhcFBhcmFtcy4gV2hhdA0K
PiBhYm91dCBkb2luZyBlc3NlbnRpYWxseSBwYXRjaCAjMSB0aGVuIHBhdGNoICMzICh3aGljaCBk
b2Vzbid0IG5lZWQgdGhlDQo+IHplcm8gZHVtbXkgdmFscyBpZiAjMiBpcyByZW1vdmVkKSBvZiB0
aGlzIHNlcmllcywgdGhlbiBhIHBhdGNoIGVhY2ggZm9yDQo+IHN3aXRjaGluZyBvdmVyDQo+IC0g
bm9uLXdwciBoZWFwICsgcG11IHJlc2VydmVkIHNpemUgKCtkcm9wIGhhbCBmdW5jdGlvbnMpDQo+
IC0gdkdQVSBzdHVmZg0KPiAtIFdQUjIgaGVhcCBzaXplDQo+IA0KPiBJIHRyaWVkIHRoaXMgbG9j
YWxseSBhbmQgaXQgc2VlbXMgdG8gcmVtb3ZlIGEgYnVuY2ggb2YgdGhlIGNodXJuLg0KDQpZZWFo
LCB0aGlzIGlzIGFuIGltcHJvdmVtZW50LiAgSSdsbCBwb3N0IGEgdjIgc29vbi4gIEl0J3MgYnJv
a2VuIGRvd24gaW50byBzbWFsbGVyIGNoYW5nZXMgdGhhbg0KeW91ciBsaXN0LCBidXQgaXQncyB0
aGUgc2FtZSBpZGVhLg0K
