Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013068.outbound.protection.outlook.com [40.93.201.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA4A3290C2
	for <nova-gpu@lists.linux.dev>; Tue, 25 Aug 2026 02:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787625904; cv=fail; b=N3gyASldZZ6uM8eMJByEKNXJLpDUZA8sdI42ZooxGtWsPbVZTr3wmf5kM+Zhx65Cn1ZZub5pEmgqWu6XJ9Z9nJsb825BAzwkOfoojl9qKy14er6ZHpz1WGqXeVDmRBGGCWmK/dP3FG/kWxiBp5pLQv79IYTgGCOx/htYWFtHpso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787625904; c=relaxed/simple;
	bh=gK8UGkF6SFQ2Kvwh9hYw1rzwquARB3fwHfMlrAdgYqo=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=d2oP6jeuLQPlcAA9sqeEC5dtyrf/YRFPKCaUsvqM7O1muWjvnOXVS0+7kI1R0Ak50TnWYpzckgg1F8rayEEbpcLMxssrZa1smMegbHvMmHREWoKFU6zxWnexqQ4b2NnrOzAL+m7qVnQQdSKKkuk8RtrVTM55/AxEoDF0FE1uGLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AL+FLDJz; arc=fail smtp.client-ip=40.93.201.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AL+FLDJz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOulC/uxUgnww7JTrDBprSYhhtWkWdNu6PAHwkz8pDU55gaMdHCJELUJbRQNfeuZlqL4OxFqBlfKP1XzDLh9GtL59F2oC32vHkK0jG+eOu04l0iJP/bVUonm4OwlvJS/KUEUAZG3ZVt1JkokNMwwWimH1ACC/pZqdBFbPvgjkjuKsR7qAvLoVDeypQV7RmI8rgjbjES0S5qs76rnWqnp40Ml+o3qGMjtx6BhBjC+Bc0JgmKpn2ydJnmyJAepPlYWU4QQVwjOVWM3HUx9Wshhr100/dBEIf6q0aqJuBk4vAX5FRyt5hdV/wll13IV/8SzF5UlTlfEUY+lQxe/wHxR1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GKec/VhY+cCm2srrdYe8HFpv4lmvL+vwGDk+GPCqdE=;
 b=k2phc9Ogk8a65UL3R6rwnuILOIH7+0eeH1jPpwXhF5ch0qkXvN4VDo5nKfWKxb+2pJbMgd0mPD5/3s/HekIUkRvfBDGd9k6UPefFXGbRGFwDs4BWFZgxhVEFILHxJ5La1O592R/9uJ6m5rnp0iPQI3wOEsmzXq/xHvfkc36UNSfMBxbvO3kjTNZk59fPvzKbYfeyPXqRMBXSYlAEv5BvwlGh6JXCX8Ggqk3HvSXqXlw5s3EWojBSWZpHnREcZO8eLH6q5qSbsgEGj3rqnxEJXWcWYBg8UyGhk9IasYlgLigsceB/nolXBy9D68CsyJ1LCGCR9k6eAR0kFTSk8I+I7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GKec/VhY+cCm2srrdYe8HFpv4lmvL+vwGDk+GPCqdE=;
 b=AL+FLDJzv/ucdRHukMpgcevLsn7kkWDGMYyYVWuwcyhOnA7XvC6zR/hERpEkQCvQpsXmurC1pLK601KwzQpFzxPEAt7hhAg5LjM6PwF2myOv5RDY2rqYR7PmfRdLda//zjP251UvB4Bc8bW9fK+AH/S/pOwfdSgixIjy69eBUpBqZgSRhEHjohH6a/EaP48ZBU8ZDLR4MYv18WRS7iR/oiJaU8SUEtxl+u1QjzhmYVvgXZOiVWa0zXGPOrSfdDGRlBRMe1FbI6CtJ1HOkmPPTYaUnG9Qmrubn53mciwVVeTucWPZdNogkVbSUGtPpT72Oq27/dyJpO3m9gk4+WB3sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS7PR12MB6094.namprd12.prod.outlook.com (2603:10b6:8:9d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 02:44:54 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0315.014; Tue, 25 Aug 2026
 02:44:54 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 0/2] rust: num: casts: replace const type narrowing methods
 with a macro
Date: Tue, 25 Aug 2026 11:44:46 +0900
Message-Id: <20260825-const_as-v1-0-1ce712225fe2@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyNT3eT8vOKS+MRi3URzS6OUxBRjS0sTYyWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQBuqXKCbAAAAA==
X-Change-ID: 20260825-const_as-a792dad39943
To: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nova-gpu@lists.linux.dev, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP301CA0064.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::16) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS7PR12MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: 06adb3e2-66c1-4995-92cb-08df0252d78c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|23010399003|7416014|1800799024|366016|921020|6133799003|3023799007|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	WApxvQXfQJO6LkGFrW6fDD8uKA1VQK6RtqNcFS1nPHcrKPQ+qHDOtZeeGboN/kwNqWRnpw9bz9ho0QY2L5aqSiS50WIuilmfFtD9dxWZIAasNEaMe+hZt2oeYeNgevBkbVr6+i/zigb3G6JHg4OLMQVJC6SE/Gyyudcngi7pSGEas95naiP+I0e8y76PvAKuuvfT8+HlTF9zU2prBAocZLkVcNwVQvyYCmBApE83lXCsqzPAYyEAn2HVLLEc5+CTQ+dFEHES4bD08bWZLmuLALGCI46SbinLvRdEHUi6GbS65oBzo3olWbrfSSlAuTAvQAXuWpa4jBC/+jtElgqFwjV6x/mhn2S8+7F3wwKoh7asDBlMLlluQ4JgXqAMD+fkS/pWO0SuwIbtnTqC3M+G93o3el2gzW7l0scn9dx0kUK4jhh0gANAECNhQ2aqMgnQcJMQ2Hw1kdQJkrCKy7YOj35MaCwNMTb1UkBoDjtvrDYvuvsEzbx8eVAzhMf3XKUHF6HpuxHkC5iFUDtqKT5WIuJTEQz+XhMVOt/gt5D6VvuiRxgfrHdSIna7KtTG6C7xarbcvW2T+hiezA4qgVWa/pyWzoBENWJZKwH+IRqlGFcH5d5IQ8XXH7rcyzS/LFjlWLg7pQu1tSqZ6NWJtRfJRQCEytPngdotAlYUFbtjO6r+aafUsfTy20v8hvbkDOxBuwmCeoXSlrTjLL3PXarO8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(23010399003)(7416014)(1800799024)(366016)(921020)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlBpcVhmRzROUm5keHYrT1FSZXErb3dkeUVFL3cwcXB1SXhOeThkRVBINlQv?=
 =?utf-8?B?emFoUmprWDQ2cFdGSUMxcWMzSXFEcUF2SVkyb09YUDF1NUF1dDkyK051TW9B?=
 =?utf-8?B?bzZjYnJPNjlWVm04NHNBRXYzLzRObkZHVHJWb3hsV1A1enJ2MVViWEY4SDJs?=
 =?utf-8?B?ZFhqTFRoRklmbDkwRytreU1COWw5R3ZjNlBEQU9NdmJVS2Rta2NHSER0cUhJ?=
 =?utf-8?B?ZTN0L2xvTGtSc1YrZGt3SDBkRjQ1UnF5cVo0a1R4enFDL0F3cEVZam1QcG5m?=
 =?utf-8?B?UTdWajFrcmF2SmpiMitRNjVzNDhFUSs5RkpYaEhjOHU2STdPallWMnhSWHN2?=
 =?utf-8?B?Z0loMjFCT1ZiZGxvT25aaDhjSU1HUlQrQWlDZEp4Q3FnZ1AvalUwa0FFTEVJ?=
 =?utf-8?B?SlIyTGl0SE1haVBpdnhpamZsMHQ1OVVJTDkySzB1WGJvdFpMd1lZZHNFK1My?=
 =?utf-8?B?TnAwd3RzSVVHYXhiRllFSkdzaHlFVzBwcjhkdWFoM2ZOV2dOZ2NVdGJTUExB?=
 =?utf-8?B?MEprZDM2WU9MNHZmZGlDQkw1TldqSnA1MmRXR2pnSVo5Z29aTnc0UVY1ZkRH?=
 =?utf-8?B?Yk9ualIvNE5VS0I3aW9ZQVZDeitIQmFJZjRkbXN0RkNrSlR0K1RrUmNBS1d0?=
 =?utf-8?B?VndNaUlQV08zTzdsbHRITHFmNmkyb2xYZ0xpeVpPWXpOQy9WWEkrYzFQK3p3?=
 =?utf-8?B?NVQ5SGFWNWhxY0dWSG12ZFY5NTJoZmFKdTBXNDl2MEpLc0ZURHRRdzlXbUk3?=
 =?utf-8?B?YWNGbGt1c2NNZUs2SGhGK2V2bEFaM0tUVVkweFU0S3plRlNFNG15bnVMQ1Qw?=
 =?utf-8?B?RlFvMTF2VzRtVDlKR1AyL216dG10NERxS1l3S01GVDhsSy9MbU4rWXZzVW93?=
 =?utf-8?B?aUQrK29qcm5ReWhMelFOSGtQMTNXc1cxemFTTjVUemJldVpHdFpuMXFkY2RE?=
 =?utf-8?B?SnVUci9SY05zTFNCZlNDaFIyOWdSS1dYaWEydGRGWnhmV2l1bi81ZG41dS9U?=
 =?utf-8?B?b0ZYRFl5M3R6QnE0NmIvWThwYWpwVk00SkVKQXpGVlJzWGlaejhOYUtRLzBR?=
 =?utf-8?B?NU5UMlkwK2ZOQzd1dVRCMDl3ZW92ZGM4Y3R0UVJ2MmdYQVNiQTRUZXh3NFJ2?=
 =?utf-8?B?WVFGSmFjZTJETDZRbEtNbDMwckl0QlhkaVB0MnFiM1E2TlRGK2U3L0VHQXh1?=
 =?utf-8?B?OU9kNXRnWldoUDBxSWFXMjBSbEpDd0JKZmROL2NxVFp5citIcEgrLzRDQmJ6?=
 =?utf-8?B?L1pjSHg1RityUnFGTDYyWWVEdG5GS1RFdDZTa3dwVEVWR1MwVVJscVZtWFdj?=
 =?utf-8?B?U2NjaHdGM0prRjJWMTFaWTNacmluK2N1ZE9uRVZnZGpzTW9KeVUvT0FBbW1V?=
 =?utf-8?B?aTdLM09ldHZXT1NKWDAwbFkzeGhndmNFYjAwSWdDMmxXbXV2dmdtcWpKcGQy?=
 =?utf-8?B?dkEraithYXJvZkNoejhZcjdUZWhDMUlMZk1RSjNzYlV4cE5FTTN0U2FMdHRp?=
 =?utf-8?B?Tnh4VmRQcVljMFM0R0NTU09RMTl1NVZtTjlVM0E4NUhucFFFZVp3MGFkV1pk?=
 =?utf-8?B?dG1TbDA4ZVZOVFJ3UFZGbktCN2kxckU2eWlsdzJjRllTWG4zL1lxOFBrN096?=
 =?utf-8?B?eEtjckY1bWFLeG9KNHE0bG05RzcvTHlCdEppR1orM2U1NEU1L3BsNEMya1VU?=
 =?utf-8?B?WGpHOVR6bHVDTlV6N0s0Q08vLzh5ZUhDL0VKR1pOZFhzWWpjUFZiZkpUaUNh?=
 =?utf-8?B?M1pQeDRFUHdNYkNLZCtjNjQxZVp3NXZQY0Q4b3RNbFpXYWo5WndTVmNGOWVB?=
 =?utf-8?B?aFA0OG1aQVREZnhXZEhwWXVTMVMxUWIyWkRDemRPTndSK2ZvaDBDVmlIQzlj?=
 =?utf-8?B?eWpTaGpQcENMb1NuTGozWEZ4V0hiRktzNWR1alZEMFlXUFR1dXh4SFR5MDhO?=
 =?utf-8?B?MzVJNFNYdE9qalZsZkN5VjdoRE5QOFdIdThNdTd6T25CeU94QXZ2NzNtK2lT?=
 =?utf-8?B?R3QzZ3hRcUROV3QxcWsyeUliU1hTOUk4dXFMNFFqZnloM1FJRFJsY3cvUVNu?=
 =?utf-8?B?cHZiZmFvL2E3S2dJQ0xVTitSK1ZCdGE0TWw5cVJxMDhQWEh6VWNBdXR3Wk43?=
 =?utf-8?B?L0FaZTVETk9yL29IMzBlR3p0STFxZGpGUWVSQ2V3MzZnSUxqeTdZOUtRNGFK?=
 =?utf-8?B?Q3ViU3huZ2VvaDN0U3ZlY1Z4NDNmRGZLM0tEaGlwckN6RGc3SmlhOFhGWnZL?=
 =?utf-8?B?VE5JVTRjWTg3Y2JMeDNONnN1OHVHcDkwbEFubGR1bG9uL3BTT1FqVzhSMUVT?=
 =?utf-8?B?M2Y1MGNLL0MwQmo0b1kweXUvV0c3LzJ4Mkx4bHNib0tDYnJYajVWdVdIR1p1?=
 =?utf-8?Q?M4xNtgeViUetHCFfkev6YTb1fPWOMARo9LH96Us1X1sLR?=
X-MS-Exchange-AntiSpam-MessageData-1: OEe6r13MMAy0Zg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06adb3e2-66c1-4995-92cb-08df0252d78c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 02:44:54.0969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yf3G/ndc5zVaA4UUsjyoVNSb1a2Zw/w+u7eAVIE0lmO1sHSfDYyOrlVbC36lrNw17Om0Vn2ZIUgHbEYVJeFspw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6094

The `casts` module includes lossless const converter functions, as it is
sometimes necessary to cast a bindgen-generated constant into a narrower
type. Such conversions are known to be lossless at compile-time, but
using `as` for them still requires a `CAST` comment and carries the risk
of the conversion becoming lossy should the value of the constant
change.

Since these functions need to be evaluated at compile-time, they take
the expression to narrow as a generic const argument, requiring the use
of the turbofish syntax by callers. Also, a dedicated function is needed
per type conversion, resulting in 9 functions generated by a single
macro. All these factors make them hard to discover and a bit cumbersome
to use.

This series replaces these functions with a single `const_as` macro that
ensures an `as` conversion is lossless at build-time. Since it is unique
and not generated, it is easy to discover, and its syntax also looks
more accessible than the turbofish one.

Patch 2 then performs the conversion of nova-core to use these
conversion helpers in the process of removing its own superseded `num`
module.

This series is based on today's `master`.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Alexandre Courbot (2):
      rust: num: casts: replace const type narrowing methods with a macro
      gpu: nova-core: use kernel lossless integer conversion module

 drivers/gpu/nova-core/falcon.rs                    |  12 +-
 drivers/gpu/nova-core/falcon/fsp.rs                |   4 +-
 drivers/gpu/nova-core/fb.rs                        |   2 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs              |   9 +-
 drivers/gpu/nova-core/firmware.rs                  |   4 +-
 drivers/gpu/nova-core/firmware/booter.rs           |   4 +-
 drivers/gpu/nova-core/firmware/fwsec.rs            |   2 +-
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs |   4 +-
 drivers/gpu/nova-core/firmware/gsp.rs              |   9 +-
 drivers/gpu/nova-core/firmware/tlv.rs              |  11 +-
 drivers/gpu/nova-core/fsp.rs                       |   8 +-
 drivers/gpu/nova-core/gsp.rs                       |   4 +-
 drivers/gpu/nova-core/gsp/cmdq.rs                  |  22 +--
 drivers/gpu/nova-core/gsp/fw.rs                    |  50 ++---
 drivers/gpu/nova-core/gsp/fw/commands.rs           |   4 +-
 drivers/gpu/nova-core/gsp/sequencer.rs             |   2 +-
 drivers/gpu/nova-core/mctp.rs                      |   8 +-
 drivers/gpu/nova-core/num.rs                       | 211 ---------------------
 drivers/gpu/nova-core/vbios.rs                     |   2 +-
 rust/kernel/num/casts.rs                           | 129 ++++++++-----
 20 files changed, 163 insertions(+), 338 deletions(-)
---
base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
change-id: 20260825-const_as-a792dad39943

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>

