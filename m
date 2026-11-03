Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793664198;
	b=KuLdWLwk15kkFF0cjQ5kn7faNaCVk4KsLsHxcC5a4sDsWN0aA4RmvE9wUCh3c6vr/hHU
	 CPhfmVGlXgR2FwFvhb1HE7S1DnykRQIBPPWEa8XdP1OuT5gLmBvIfDyCTk6gFtXExPEZK
	 oyCyrpN+YJ76thu2Ue4Emula5gw3+7iD4Po7qlFPl9G+gh0c5uE6n4yXqAHm2IWkqrH+1
	 L69/DBbPrvXi7HKRDFGI4m7MGGf+GsnQHSyIZ2wkT3mQAnAsW4G/v6gXdlqVrLb7PO8NQ
	 mvifMUfdBNb1/RCGIHfsuMeZRbMa2RZwhiCZaCVB98zPUf/ozCpeQfSm1jXkznTiw6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664198;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=0CXnJ9L57Cufxz3vo3ETwKI7ZvDGuJE0rFM/17MsLlc=;
	b=TZcyJjeoh2Bx2vFKjjcLFewGiVog9ty4dbzjeTtLA2auyiltSJEONpEvU2NH42Fh9iSC
	 cIG0Vs1qj2Gb25GojGP4fb7w0zsiKZh0OP807++hUlpfaJ+G+YcPe0RWmji9wdIRi37G6
	 q9biLYdcvRSjLN81Dcm2Av8hmkQfBFmPAzJMoAUyEuQfYyvfj1Ig+V7EULMz6Y7vtl0nP
	 7muKtCqDLQFKthuqCGt0Bv0b2c84MBv0U+qiq31P1WhTAAfK27RWUSdjsldJg95fCi26W
	 zK6ZpeekzTBfIzrmZ3yxxfhqAjOtyJl4EkK46dJkVtL1a+y32Jj3T9mU1siinYoVxXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QjTDsW8j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.41
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013041.outbound.protection.outlook.com [40.93.196.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F7C606A334
	for <nova-gpu@lists.linux.dev>; Tue,  3 Nov 2026 00:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3F7C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QjTDsW8j
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFTQP2oFOOHMUnUib3uGYhvRuyUIyR6M2XX2TzYB65knH5gtJEBZAQqyu8FJxSwKbNf3gvXz7mPx8o/RKTZ/fuzCMuG7DvjDi7pD47TKnrMclaUKmdZ0EJdw0rhZ9jugUVPq8IcWMBdQHveLif82NZmkDEQXEJ0cUq0+TunSlDUzjUOOZ79grYn2mfCiaQ0NrTFT89PUXYlEoQ9GD566uDD9JdBJ+ysoib3DcwDoADG4gQTsaPmB+ETMhrTWR+QPPitWk72n12/juUMgcRBdfr8W7eAxhYXceq+YJerfI5EZO5UlEiVaxU3C4kGJa1xMX7JzjEu0ehYJOLXGdHkEkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CXnJ9L57Cufxz3vo3ETwKI7ZvDGuJE0rFM/17MsLlc=;
 b=pbzm95q2oobuh3k8Tp84r6YN+MacNNodZEee3x2S84t/7qJVwu11I4ed8xq0VF76kBzMyGApxbMSZoROkAZHmuCGaiH1PhOEwv39LhAkzElsIdTGGV2gDhmx7jMAQw1YaF1x9SsAxCZhMuuPi4iLYLY00tcZoeGmzoldq968ym48+JBgQmwaxMBm5vpdQmuDs7961EoiHQM3xaJDy+0YPshXJujpkrtMrfLmd8moBsIHbyzi+GbQxIfUdtomzp5kYuT6SJObIBR7Ka7Eo72vxqXRzpNlwbfNNOLqi/rlGK1t2r5wdiMVYbC7bAr1wE4zy1kDiQIo+o3NyH5NjKikug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CXnJ9L57Cufxz3vo3ETwKI7ZvDGuJE0rFM/17MsLlc=;
 b=QjTDsW8jCfptQQ9306lYfQCajcOqcxIVD8EtTk5+DP8A46xWIvvZeKRgFs+vqKk/MMJM7C02b2AX8qSJ1cqG8CwVkwVdoDeVzE1IkPZ1gr25ivmcpORsYjahdOLF8aR5YV6nBJJroH5zHv3PkSlQDJoauVZX0K6mCMIs1ntVg96bckfHn2hbVBR+nmCdoD3mfcg8NLLTTKHSgST9Fl15CkQGGkpyOnWF/7uO6LByjyjHxnsQWJWs+YWGL9Sl8jjkX7N3R6IJfascEGYpLdzbbtNBD9SH0eXwXMhPUy4ZJNny+YgjMb6Nc+ELUK+GihoCs+gRzIkGazgPizMwemKYIA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB6858.namprd12.prod.outlook.com (2603:10b6:510:1b4::20)
 by DM3PR12MB9415.namprd12.prod.outlook.com (2603:10b6:8:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 00:03:13 +0000
Received: from PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d]) by PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 00:03:13 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 03 Nov 2026 09:02:54 +0900
Subject: [PATCH 4/4] gpu: nova-core: gsp: cmdq: add the GMC receive path
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-r000_rebase_on_cmdq-rpc-v1-4-189f9ff3bfd2@nvidia.com>
References: <20261103-r000_rebase_on_cmdq-rpc-v1-0-189f9ff3bfd2@nvidia.com>
In-Reply-To: <20261103-r000_rebase_on_cmdq-rpc-v1-0-189f9ff3bfd2@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0083.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::11) To PH7PR12MB6858.namprd12.prod.outlook.com
 (2603:10b6:510:1b4::20)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB6858:EE_|DM3PR12MB9415:EE_
X-MS-Office365-Filtering-Correlation-Id: 2467be2f-439e-40e4-c7a2-08df393ddab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10070799003|6133799003|10067099003|22082099003|261102123227099003|18002099003|3023799007|56012099006|11063799006|5023799004|261022105027099003|261021121427099003|261026121527099003|261026140227099003|261021123027099003|261022075727099003|261009223027099003|261028144727099003|261021135927099003;
X-Microsoft-Antispam-Message-Info:
	HVPEy+D+66L57EKSzoT/hAz6h4E9cJGBGXWM42wfGqC1icEeqkyDOVNTEibSpmPOJIwOtEhJ2ZF6ZiKOKXymhi4EYhKE0+C7297B7N5KAHMKKBiiSmswhZ6hxeqw0z4/xaG4KJJ7ao3FcyQAYD10WsOVoQf1m6HjoSPsnezLh1In54idxdph5YQxE36Gg20S4EVVkhXR4d3KryzOVJ3p8naKJcS0fI/HSCa/CB+s01B/RYFvDelRWd77qD05ArY6behW5Eqcw6eQ335qO5BmnLIK7IqKuY+pMW8UycMMJcnOSth8jHgMKEzswtyJ6epmK84hUKBVR9rkNXEDiEFvBcofcbsCr6YGzdq6UXIt2HR1mwfcVAMKxEMEqh39oCFCWO8dLVsrFso5ISDZBAhVMAvLIFj477yEcM0SCcyCGdqg8ukUIJj/Qdb7hHvBXlG3IjkhGIhNer0KiPiRYnJ0V0UgL2YUmODjEdahO/6aanqXLrCgfV2BvtV+wJrcRZIoVSdtCiOOoIAx2tFsnwW32wSwnGN1lIJ+32QT2pP7PT+lAOnwZKYgTgOXt9oP1CjsN4eBaC7Rv7ix4gehNJ2XHEue1vhO3UHbPwc2ZJZCpV8n5rJ9lsoFJw4pm9QO+zFR1mzFMg74KT3HSqHMGtUr5WCcWHh5h5Iz7BBZ8O2yBKI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6858.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10070799003)(6133799003)(10067099003)(22082099003)(261102123227099003)(18002099003)(3023799007)(56012099006)(11063799006)(5023799004)(261022105027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261021123027099003)(261022075727099003)(261009223027099003)(261028144727099003)(261021135927099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0dHVGlqRitzTThqbVZTU2M3N0QrUlNlWjZKcVNMS3ZFTkErQkpKVjZVS0RD?=
 =?utf-8?B?bVp2MmtNRVpxeUlNQU5FTWdOZFRYZzF4YmtTUmsxR24vZS9LanVmbG4rZkpl?=
 =?utf-8?B?aVFrS1hSdXRKeUUwZzFTc0FIaE1IUXdyTmExSkhsaG1kajZjbzgxWk9OQ1NK?=
 =?utf-8?B?bE5oSHR0MnJJamZiVE80a3dMYnZ4dWhwR0Jldm81U2FPV2JDa2tRdlhyeHNy?=
 =?utf-8?B?Y21HbWNtMzdxZmI1Mk5pTm83TjY3Y0g5YUlmTmdlMU00U3J0ZUtBMmNubHdR?=
 =?utf-8?B?cis1NmUwUjJZT1lrZWU0cCt2VkMzak04aVR2UDhNSU0raXcyQUlEbXhFL2hw?=
 =?utf-8?B?VHFoSXYvdWV3Z1dsM1lUd3d1QmpML05xNkdFaTBGRFZERjJTTk9MbXZPWW1j?=
 =?utf-8?B?SWFTZ2FuMkNyVGQrdUR1ZzRoakhoaG9jdlYzRitqNkxoT2wyTFdPZXNCTzc1?=
 =?utf-8?B?c1lXUDg4WENIVlJrUHg3M2EzZ0pCRUo0QTZ2aUYzWHBvQ084TysxbTdmM0RF?=
 =?utf-8?B?RnVMTFJuUDArUmxuZy84OGduYm1ESUF1eElkK25NVk1JLzNCMzlFVCtNYit2?=
 =?utf-8?B?Q2hhZy80U2xFMmUwb3g5UEc3R3M4NDZiVDhBNDhzcWFPWEdlZWJJS3dhUGU3?=
 =?utf-8?B?NFd6c3BhYmtvV0NjNVlMVDNYaklOYk1XOHdKUHBqTzlwL2w4Rjl1VjZIQ09i?=
 =?utf-8?B?b0FCeDV1eUNCSE5iUWpnN2pWeUJER0YxdGcwSnRxWVhySXZFbXpneG1obnF1?=
 =?utf-8?B?TGhJV1B0TzdMV2JUSmIwUE5DWGV1SnBqaEN6OTkzSmV4MktURnM5YzRZSHBo?=
 =?utf-8?B?QW1ac0p2WXBHTzVra09aN1hVVVhiSG1tRmduc0ZjMHYvRlRHczQrY3k2bm5l?=
 =?utf-8?B?QlpDSG5LdEszK2hkNXBFclVLNXAwZVM0b2g1KzU3K3BLeGRkT0JRdjRWVWhX?=
 =?utf-8?B?eUN6byt4emorZFFqZnZtV2thTkxPc3h3aWlLVVk0Tk4vdjBpY05RcVBlTDMr?=
 =?utf-8?B?UG5Zd1ovL2c4Q2F6TWU1S2h6b3JhYmdDSFhKekZMdmc3YjJHYVpDRllIUDZR?=
 =?utf-8?B?V1hUekN5cmVoR0EvSXcvRHpHRGc4WFd0MFNsaldDSGY3cmJweFdtZHlrRVdP?=
 =?utf-8?B?eDkwU3IzaHBqaTRNQlJBR0NvSVlFaVNsdW02eisyUGZIM3B2NSsyM25vTENh?=
 =?utf-8?B?K1E2NVFvMjBmcU1UdEFPRzVhVEhMUlVJRDhMSFlkOGtIQ2xHWWwrNFdDU2J6?=
 =?utf-8?B?azl4YWpWcW1LTlIvWmdCS0pYL2dDTExlY2VUZlBuUUdMNTQxSUhaVWRvR0tl?=
 =?utf-8?B?OHNxRUtkZWlLUVU0eU1nZkNBb0JpSUJleVBSbnlTMElxdlB1SndMWEhxZ2tz?=
 =?utf-8?B?TGVHMEhFU0xESW1uOFQ1QlhlaklrTllUQmFheWVlMURmcUJzU2NZL3AyTDJm?=
 =?utf-8?B?eHVnSlVvYWl3QU1wV3dPT3NQZStYKzNiTm9zZFZGQXZPVHM5bG1CdVQvOGJD?=
 =?utf-8?B?YWhXWE1IYkpWem50c01JMEZOblBsOGszY0lpQXlHTFFNVHJIQTJxNzdHaU1Q?=
 =?utf-8?B?cy94eWpScHZVeHBwcm1DSTRJRmd0b0c3dDBpMXQwbGYvOFV4czBXU0pQa0Jx?=
 =?utf-8?B?dGk0QzhSQnQzSGMydHkyR3M3U0xCNXRUL1pWYUFKQVJqeldBQmRYdVJhNUJz?=
 =?utf-8?B?KzYxd01samtzcHVxVmFxRzlRUXhiNytYa3FlQ00xZ0V6T2ZsNnYxc0gyN0Mz?=
 =?utf-8?B?VzFUQTQ3aUNIRVQxcTcxdEd4MWFGWGVudlRLckJkV0g2YUhyQ3J3K0NFaWtx?=
 =?utf-8?B?WHp2bHRJWjlXRFkwdlBSOHRFYVVQZzZhZ0lBaWVPTUtlRGRZclh0Ymt5a3hP?=
 =?utf-8?B?d0N5RTVsSG96UElMRTFUWnhuaFBtNmM1SXh2Y3pmdllyQWY5Z1R1dVFGeU91?=
 =?utf-8?B?Tk9wRnFPeTVrbEdSYlFsbzlIc1dZN3UvbXZjUEpmZ3Bvc2tJNTYzZ3FIcEZB?=
 =?utf-8?B?UENXUFVXU1VPblgrY0VpY285Z2lWTmVEUzc0aVI4NUoyY3c4T0tYNnl6bmFE?=
 =?utf-8?B?Tm54YWsvQ1p3Vm0vSFd4TlY0SndXZ2w5ZWJhTjlmVlNwU2VYYUlMZW5FMWVM?=
 =?utf-8?B?L01IVkNUeVhVVlByRUdES3d5c1RUTzFpWnhXb2ppUGdTNURvdGZscWNVNmRH?=
 =?utf-8?B?ZWVDclJ6YzkyUzM2SXFhbVhWTzBhdVcvRVNXOFRDZS9TbHZZdTJLc2lQdytq?=
 =?utf-8?B?MVY4RzVtRGVkMklUWVpxUGZCZmQ1bnplZEpkWjF1VUg4SlNBaWFHWmlOemdk?=
 =?utf-8?B?LzJnQnpKS2Nla2l3MlhiTHNudE5qNCtJWHdBcFYvMkFlREhjYmlmYnBQamZx?=
 =?utf-8?Q?ZNlSIZWRnULpNx97IgiRBpFruu0KCJBBrFw0fV3bI+JIH?=
X-MS-Exchange-AntiSpam-MessageData-1: ojPuIytHpXup/w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2467be2f-439e-40e4-c7a2-08df393ddab4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6858.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 00:03:13.6057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: syQrt2eaudWNzqdWOT+dxqiV+0n5y5MJhJsRxPYaFv1Vw9JG0Gjy1o3joPADrQuVgd7RZt8MKS5TiY9FwrMcEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9415

From: John Hubbard <jhubbard@nvidia.com>

GSP-RM answers a GMC request with a GMC message whose command word
carries the response flag and the id of the request, and whose sequence
number is that of the request. It also raises GMC events, named by a
command id. During boot, the load-and-execute events arrive while the
driver is waiting for the GSP_INIT reply, and GSP-RM only answers once
they have been handled.

Add the receive side of the gmc sub-module, mirroring the
already-existing rpc sub-module.

The transport cannot produce GMC messages yet: the r570 queue element
header does not carry the type of the message it transports, so the Gmc
variant of GspParsedMessage is only constructed once the switch to r000
makes the transport dispatch on the NVDM type. The RPC receive path and
drain() account for it by logging unclaimed GMC messages.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs     |   7 ++
 drivers/gpu/nova-core/gsp/cmdq/gmc.rs | 230 +++++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/cmdq/rpc.rs |   8 +-
 drivers/gpu/nova-core/gsp/fw.rs       |   1 -
 4 files changed, 243 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 629ab8d35f87..a1fa7a3b4079 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -420,6 +420,12 @@ struct GspMessage<'a> {
 enum GspParsedMessage<'a> {
     /// A [RPC message](rpc::RpcMessage).
     Rpc(rpc::RpcMessage<'a>),
+    /// A [GMC message](gmc::GmcMessage).
+    //
+    // The transport header of the r570 firmware carries no message type, so this variant cannot
+    // be constructed before the switch to r000.
+    #[expect(dead_code)]
+    Gmc(gmc::GmcMessage<'a>),
 }
 
 impl GspParsedMessage<'_> {
@@ -427,6 +433,7 @@ impl GspParsedMessage<'_> {
     fn log(&self, dev: &device::Device) {
         match self {
             GspParsedMessage::Rpc(rpc) => rpc.log(dev),
+            GspParsedMessage::Gmc(gmc) => gmc.log(dev),
         }
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/cmdq/gmc.rs b/drivers/gpu/nova-core/gsp/cmdq/gmc.rs
index b035f30479a8..9adba5cbcd5c 100644
--- a/drivers/gpu/nova-core/gsp/cmdq/gmc.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq/gmc.rs
@@ -29,7 +29,9 @@
 use super::{
     Cmdq,
     CmdqInner,
-    CommandElement, //
+    CommandElement,
+    GspMessage,
+    GspParsedMessage, //
 };
 
 /// Trait implemented by types representing a GMC command to send to the GSP.
@@ -150,7 +152,167 @@ fn write(&self, dev: &device::Device, seq: u32, dst: &mut GspCommand<'_>) -> Res
     }
 }
 
+/// Trait representing GMC messages received from the GSP.
+///
+/// These can be either replies to sent commands that expect a reply, or an event not bound to any
+/// command.
+pub(crate) trait MessageFromGsp: Sized {
+    /// Id of the command this is the reply to.
+    const COMMAND: GmcCommandId;
+
+    /// Error type returned by [`MessageFromGsp::read`].
+    type InitError;
+
+    /// Method reading the reply from the payload of the message and returning it.
+    fn read(
+        payload: &mut SBufferIter<core::array::IntoIter<&[u8], 2>>,
+    ) -> Result<Self, Self::InitError>;
+}
+
+/// A GMC message ready to be processed from the message queue.
+pub(crate) struct GmcMessage<'a> {
+    // Reference to the GMC API header of the message.
+    header: &'a GmcApiHeader,
+    // Slices to the payload of the message. The second slice is empty unless the message loops
+    // over the message queue.
+    contents: (&'a [u8], &'a [u8]),
+}
+
+impl<'a> GmcMessage<'a> {
+    /// Validate the GMC layer of `element` and returns its GMC API header and its contents trimmed
+    /// down to the GMC payload.
+    ///
+    /// # Errors
+    ///
+    /// - `EIO` if the element is shorter than the GMC API header, or than the payload length
+    ///   advertised by the GMC API header.
+    pub(super) fn parse(dev: &device::Device, element: GspMessage<'a>) -> Result<GmcMessage<'a>> {
+        let GspMessage {
+            contents: (slice_1, slice_2),
+            ..
+        } = element;
+
+        // The GSP message header and the GMC API header together are guaranteed to fit entirely
+        // into a single page, so it's ok to only look at `slice_1` here.
+        let (gmc_header, slice_1) = GmcApiHeader::from_bytes_prefix(slice_1).ok_or(EIO)?;
+        let payload_size = gmc_header.payload_size();
+
+        dev_dbg!(
+            dev,
+            "GSP GMC: receive: seq# {}, command={:?}, length=0x{:x}\n",
+            gmc_header.sequence(),
+            gmc_header.command(),
+            payload_size,
+        );
+
+        // Check that the driver read area is large enough for the message.
+        if slice_1.len() + slice_2.len() < payload_size {
+            return Err(EIO);
+        }
+
+        // Cut the message slices down to the actual length of the message.
+        let (slice_1, slice_2) = if slice_1.len() > payload_size {
+            // PANIC: we checked above that `slice_1` is at least as long as `payload_size`.
+            (slice_1.split_at(payload_size).0, &slice_2[0..0])
+        } else {
+            (
+                slice_1,
+                // PANIC: we checked above that `slice_1.len() + slice_2.len()` is at least as
+                // large as `payload_size`.
+                slice_2.split_at(payload_size - slice_1.len()).0,
+            )
+        };
+
+        Ok(GmcMessage {
+            header: gmc_header,
+            contents: (slice_1, slice_2),
+        })
+    }
+
+    /// Returns the GMC API header of the message.
+    pub(crate) fn header(&self) -> &'a GmcApiHeader {
+        self.header
+    }
+
+    /// Returns the payload of the message.
+    ///
+    /// The second slice is empty unless the message loops over the message queue.
+    pub(crate) fn payload(&self) -> (&'a [u8], &'a [u8]) {
+        self.contents
+    }
+
+    /// Returns the status code of this message if it is the reply to `command` sent with sequence
+    /// number `seq`, `None` otherwise.
+    fn is_reply_to(&self, command: GmcCommandId, seq: u32) -> Option<u32> {
+        if matches!(self.header.command().id(), Ok(id) if id == command)
+            && self.header.sequence() == u64::from(seq)
+        {
+            self.header.status()
+        } else {
+            None
+        }
+    }
+
+    /// Logs an event, meaning a message that no caller was waiting for.
+    ///
+    /// A reply that nobody claimed (e.g. one that arrived after its request timed out) and an
+    /// unknown command id are logged at warning level. Other events are not logged.
+    pub(super) fn log(&self, dev: &device::Device) {
+        let command = self.header.command();
+        let seq = self.header.sequence();
+
+        match command.id() {
+            Ok(id) if command.is_response() => {
+                dev_warn!(dev, "unclaimed GSP GMC reply to {:?} (seq {})\n", id, seq);
+            }
+            // Nothing to do for the remaining known command ids.
+            Ok(_) => {}
+            Err(_) => {
+                dev_warn!(dev, "unknown GSP GMC command {:?} (seq {})\n", command, seq);
+            }
+        }
+    }
+}
+
 impl Cmdq<'_> {
+    /// Sends `command` to the GSP and waits for the reply.
+    ///
+    /// GMC events that arrive before the reply are passed to `on_event`, and RPC messages are
+    /// logged and consumed. The boot sequence relies on this to handle the load-and-execute
+    /// events that GSP-RM raises before it answers `GSP_INIT`.
+    ///
+    /// The queue is locked for the entire send+receive cycle, including the calls to `on_event`,
+    /// to ensure that no other command can be interleaved. `on_event` must thus not use the queue.
+    ///
+    /// # Errors
+    ///
+    /// - `EMSGSIZE` if the command does not fit in a single command queue element.
+    /// - `ETIMEDOUT` if space does not become available to send the command, or if the reply does
+    ///   not arrive within [`Self::RECEIVE_TIMEOUT`] of the send, however many events arrive
+    ///   while waiting.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`GmcCommand::init_variable_payload`] method, or if the reply carries
+    ///   a status other than `NV_OK`.
+    ///
+    /// Error codes returned by the command and reply initializers, and by `on_event`, are
+    /// propagated as-is.
+    pub(crate) fn send_gmc_command<C>(
+        &self,
+        command: C,
+        on_event: impl Fn(&GmcMessage<'_>) -> Result,
+    ) -> Result<C::Reply>
+    where
+        C: CommandToGsp,
+        C::Reply: MessageFromGsp,
+        Error: From<C::InitError>,
+        Error: From<<C::Reply as MessageFromGsp>::InitError>,
+    {
+        let mut inner = self.inner.lock();
+        let seq = inner.send_gmc_command(command)?;
+
+        inner.await_gmc_reply(seq, on_event)
+    }
+
     /// Sends `command` to the GSP without waiting for a reply.
     ///
     /// # Errors
@@ -191,4 +353,70 @@ fn send_gmc_command<C>(&mut self, command: C) -> Result<u32>
     {
         self.send_command_element(GmcCommandElement(command))
     }
+
+    /// Receives the reply of type `R` to the command sent with sequence number `seq`, waiting up
+    /// to [`Cmdq::RECEIVE_TIMEOUT`] from the call.
+    ///
+    /// Any GMC event that arrives first is passed to `on_event`, and any RPC message is logged.
+    /// Neither extends the deadline.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if the reply does not arrive before the deadline, however many other messages
+    ///   arrive while waiting.
+    /// - `EIO` if a message fails framing or checksum validation, or if the reply carries a status
+    ///   other than `NV_OK`.
+    ///
+    /// Error codes returned by [`MessageFromGsp::read`] and by `on_event` are propagated as-is.
+    fn await_gmc_reply<R: MessageFromGsp>(
+        &mut self,
+        seq: u32,
+        on_event: impl Fn(&GmcMessage<'_>) -> Result,
+    ) -> Result<R>
+    where
+        // This allows all error types, including `Infallible`, to be used for `R::InitError`.
+        Error: From<R::InitError>,
+    {
+        let dev = self.dev;
+
+        self.await_msg_with(|message| {
+            let gmc_message = match message {
+                GspParsedMessage::Gmc(gmc_message) => gmc_message,
+                _ => {
+                    message.log(dev);
+                    return Err(ENOMSG);
+                }
+            };
+
+            match gmc_message.is_reply_to(R::COMMAND, seq) {
+                // Message is not the reply to our command, log it.
+                None => {
+                    on_event(&gmc_message)?;
+                    return Err(ENOMSG);
+                }
+                // Reply has an error status.
+                Some(status @ 1..) => {
+                    dev_err!(
+                        dev,
+                        "GSP GMC: command {:?} failed with status {:#x}\n",
+                        R::COMMAND,
+                        status
+                    );
+
+                    return Err(EIO);
+                }
+                // Reply indicates the command has succeeded.
+                Some(0) => (),
+            }
+
+            let mut sbuffer =
+                SBufferIter::new_reader([gmc_message.contents.0, gmc_message.contents.1]);
+
+            R::read(&mut sbuffer).map_err(|e| e.into()).inspect(|_| {
+                if !sbuffer.is_empty() {
+                    dev_warn!(dev, "GSP GMC reply {:?} has unprocessed data\n", R::COMMAND);
+                }
+            })
+        })
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp/cmdq/rpc.rs b/drivers/gpu/nova-core/gsp/cmdq/rpc.rs
index 36cba7c28d3e..de3734daa99e 100644
--- a/drivers/gpu/nova-core/gsp/cmdq/rpc.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq/rpc.rs
@@ -387,7 +387,13 @@ fn await_rpc_msg<M: MessageFromGsp>(&mut self) -> Result<M>
         Error: From<M::InitError>,
     {
         let f = |message: GspParsedMessage<'_>| {
-            let GspParsedMessage::Rpc(rpc_message) = message;
+            let rpc_message = match message {
+                GspParsedMessage::Rpc(rpc_message) => rpc_message,
+                _ => {
+                    message.log(self.dev);
+                    return Err(ENOMSG);
+                }
+            };
             let function = rpc_message.header.function();
             if matches!(function, Ok(f) if f == M::FUNCTION) {
                 let (cmd, contents_1) =
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 367c8b5e3443..de61afd60403 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -935,7 +935,6 @@ pub(crate) struct GmcCommandWord(u32) {
 /// In a queue element, it follows the queue element header and precedes the payload of the
 /// command.
 #[repr(transparent)]
-#[expect(dead_code)]
 pub(crate) struct GmcApiHeader {
     inner: r000_00::GMCAPI_HEADER,
 }

-- 
2.56.0

