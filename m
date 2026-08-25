Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011018.outbound.protection.outlook.com [52.101.62.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10DA35E1BF
	for <nova-gpu@lists.linux.dev>; Tue, 25 Aug 2026 23:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787700082; cv=fail; b=Q+LrM2wutHp8laChoLbQE7sSIqurjuwSVuUMnFjBtLoSkPLCvA4toLqkXrnEhpUL1j5TLONqK9NeQQtg8/k9XqTtITftoyJwmx7kWuStZmlfuFLtjs6hZqYZfbsHoz0D+1GNblagFD6/46pwHrHSlZVzMPwL01rmhwRllSea10M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787700082; c=relaxed/simple;
	bh=ZPvAbztDf7RAsxYipz5jvXRwTxJaexTuP5xzdSZSseQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=MASehIZNOZ+MclYCyMTonpu+sLtbFLDhiUpgBdmfrtfI7aoh5BqYcUIMZ7ZwKVSZuGWPW+mn7l7sWZYXFlKoAYQES5bZqFSbiQSQSPqvThEDxV0iZKNIfWq08YRUyhJZOD1bCyGf7qUE3qw9R/F1vYvFYSe5FMJ0ikzGGYKs/z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cwpkhWlC; arc=fail smtp.client-ip=52.101.62.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cwpkhWlC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=psjj+ESxgs6OoLKIlub4koYqUin0i+TeScuwX6FgIn4u1GAWoGVB0yAH4uJszGjZa+Odtzn3sg24MeQazGG3/JVMR9B9KklW8jipqo9PGQjeIfzRei+c6mC2aIgrOpu+QWtvc39p4Ln7SqFz6CxToBXGkc1t3Rw0n2T62dKStHPGilG+0k7FQpt7HIxABv6Yx9U4oWykyG+y14K1s1hE7HHEVBFxb8JmQ6V2zELeLuAY7M1jxi8I/M56l8pNj/Q2PPJxjvrSBp/4iq5eUUD2XzofTlmEaO7CGw6aZRW5ULzDO3cEofGaOLGvk0yTmolK6K9tgrshluDlOEL5HrPFew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3xK/Wu8tA5oSaL0G19tCf+02i/dF9+QuEX3fQHXUDU=;
 b=T2etREU2YCsyBzYN9ex03wlwNsgYunQfcXq2A7JEWMPFdiXuFYV//ypCcuqP2Iph0D35l2LyMxxvsoSFL8iV1wLugTzd70dak1sRgr10w6Fc42W8tmray8QS6vneB6uSjySdj/qCkdPtxdH5/BS+VUHJjvAalIoFxDhhb1RO3OIKxDsAKq9LyANFfn2lUXcBqVdZrMFbvFj1EQqSOjoxfb8b9sZDYOxXryXKr+ktTaTZlvlFN3oBCnJJflhsUCUKhKefX+Giv8xzReBF9egKbQu/PcDPY+vQiM/JwnI/Lnv9iytBZ2rhFjonD3o+QAeRfOqjlJe1pHkluCbByV11GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3xK/Wu8tA5oSaL0G19tCf+02i/dF9+QuEX3fQHXUDU=;
 b=cwpkhWlCgYJ7wWFC5auq42d6BRSDuR6Iu3do3kR35IcCrKiNvDHRlTadNTRFzm7O4cOBGzj6OxiJug7P026LQAfQT5VpsL6hQA8TjRfZ0mgNdsby73vchfyjhVMm6ehWd4+o+dWrBCB02Aq/MuGjUaknXSAwtNmivCJGWdLYT05A9DUMI1aP6aM00XUBZJtYLBsGj3dmPjyxXdw8WYhjzzKmTPEv4JFqRyi5NQ0NPTkwxQMVFrV0x60kvafKRzOMzkdp64o2qfj/EdWIr9cvIH+qZ9pXaIcyP3CBJQuURCwiGsHlztzqVUTfkxg+xUKqF829Y8YtmBg2+oVjE22z2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 SJ2PR12MB8882.namprd12.prod.outlook.com (2603:10b6:a03:537::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 23:21:15 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0360.006; Tue, 25 Aug 2026
 23:21:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Aug 2026 08:21:11 +0900
Message-Id: <DKYESB5IPE37.4UKNYYX1713Z@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: fix incorrect naming/framing of GSP-FMC
 firmware
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alice Ryhl" <aliceryhl@google.com>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260825-gsp-fmc-rename-v1-1-f82526f01d7d@nvidia.com>
In-Reply-To: <20260825-gsp-fmc-rename-v1-1-f82526f01d7d@nvidia.com>
X-ClientProxiedBy: TYCP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::8) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|SJ2PR12MB8882:EE_
X-MS-Office365-Filtering-Correlation-Id: a1315861-3747-4e56-5e16-08df02ff8eb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|23010399003|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	daINT4FcGlOWWp8UByqNsXTMLZxIcueLsXo+rKsvdiYEyIIW+U5GTZKSUe5q/VcbabcMsaV9hdjkvbsu61VfWyhPJNSoGwuc/1yKbSsYGplldl281BMt2MunE73EsdpV1+eVLO9fx4APZWBymTChCE21DMuVtnB2e7gnFswaxmnXXveCiBl8ROoYrMcptYr3hwTmtzf+s588Gnz7uk6BStn4w8Jafc5SabfgZt5Uj5r7fp+cVejVR5si5v9kbPsowJ+ur++QC+ELfxhFtJgRqqb1VpWZXBExRRV0gdEEzOBc8ir23bqID+UA30F8cmRACQ5HPVd3jLzNvKoq8nBB3FYfCURNtIPKm/8QlYRStzTq5dPb3KCIdtVmfSWH/c/A06QsolHEWMuuw/77FXFUlaO5zOtd958pMwsBWz3PT4nkU14f+O4LrBXxAxWgaJXuCg1gIWgd2hr0/dmJvCnIKwRBV2VGI5oLY3kw+3i8DVCswyWbDupktbm/2LTOT53qRBpu/M9bvgADTbHUz0mrwHpnQIpChKIlSSiZ+hHNlb7oHIyBsgfxV0EAbeoOEhFM1oWxvE22CdbozoWKCsuqyun62S1HNP/9DRfUpBn2nlS4ikFqhPn4yCRgiCo1SDAyCUzMy6yflurz9g1RtIWY9muOtIrcWaxAenlYM6UEQbg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(23010399003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0xhUHBtTTBMcE4vMmNFQmlOZytzdy8yVlByRjFielFlYnM1RDZKS2NEaloy?=
 =?utf-8?B?M2xNVzJiSFNjb3FxTXJVTWRXVEZhcDhveDZGdkpxMFVQNmhrQXRTcGVKWnRI?=
 =?utf-8?B?SFB2eVpXZlNZUjU2d1FYUm9kWERISnQ0YS9yU051TGFhUnQrZEJWTU1IVXBx?=
 =?utf-8?B?ZjgwMU1FWGJ1N1A4WTB0R3kvUHA2WlRMYy9pZml4Y2M3RVl1TStFUHlZd0Jz?=
 =?utf-8?B?RnYvWFkwQ3dXeVJramY0SUhYQWxyTmlQSk9hNjRHWkJDSHdaQ2NXeVd4OXgr?=
 =?utf-8?B?MldMZ3pvaUlPVTdtOHJaaVJZU2prd1AzWVVJOTdFdG1xbGF1YmRFUzNnWVZk?=
 =?utf-8?B?SEFZKzNYUklDMFUvQUsvdkxmNmtINE5neXBtSXE2QW9CVXV0M25PK0dWSUxk?=
 =?utf-8?B?MERSclk5OVhReXpGelNHaXBNSjBUT1J2SUUwRTgram5RRWVkVzJ3anR3Y2Uz?=
 =?utf-8?B?WjBnK0FsdGc0bDNXekVweE5rZUVYSE5YMS9IOWdVUmVkZVZMUTZndmo2RStC?=
 =?utf-8?B?YW9HUjZqem1JTiswdkZ2WkNFVHR1ZGpNcTBmMVlZS2U3UU9PQWR1eURsNFhL?=
 =?utf-8?B?U3lNekczQytZOWcvSUoxV09Ya3V4Q3dJa2ZFU0QyQXlBSEVUUDdvdzJsU2xi?=
 =?utf-8?B?Y2Z6S2RQZnVBNVk0L0pvTXNGc0JVOGFzT3lYdHdYNXBPRjZZLzNkMTMyOGwy?=
 =?utf-8?B?cmZaOXdjWkhkOGR6LzBHUnNkSmdKdjVZd1JmYlF2SWNzTjdsUWI2S0g5Q25Z?=
 =?utf-8?B?TjQ0ZnlSR3JYYzlyb3psT1EyQ2FLeGVpK2NMMmZGNWhlYW9QTnF2ZE82K21I?=
 =?utf-8?B?M3R6MFl4bDFZSnlobXNCbzlCRDNWNU80ZnlvRkpsS3FibUNXN281a1hDbUVU?=
 =?utf-8?B?MWpUTnJGazVUV3QzSVlxWnVDVUJRbTh2TTBzWFdEQ3Q5bmJIcXAxOGMreU9J?=
 =?utf-8?B?d3pRVHdMTmRTTzZxQjNvcCtzdFBvZERQRGZyaWZCTXJ0Q3VhZ0tRbjB5eXNv?=
 =?utf-8?B?Ynk4dzFnbzNmNFF0ZGtUSWwyalJMMHllVWdXWTgwMGp1RjR2Njd3WUdUY2xv?=
 =?utf-8?B?VW85K25TTGwxVHpDREw0N0lIWG4vcUNmL2ZVeDlQcWJ2WndZYjB4RkJlTG91?=
 =?utf-8?B?eEo4QmhpQ2dNaURFVVhJdlJWRXJIM0RpNnVaYkp3VWRTMThEelBsQ1BJZllz?=
 =?utf-8?B?SjcySTc0TXVWNG0zR280K0xrVzhvL2JTcGs4aktNcktnMkVTdm03Nk03WmZX?=
 =?utf-8?B?Y203Tm5DMkVVZklsazlxMEVmUThQSS9OQjNKSkFXTkE3YWZFZXEyN2pNSVpl?=
 =?utf-8?B?YXZZRy9HRDdyTkFpdG1MRUVPVFFJKzhlQmhjN0FWMHRuZ3VHbW90cWoxU2xI?=
 =?utf-8?B?NVZ1VElYMS9kMzU5djRHWU1xWXB2OTVXcEJPQm12djhyWUVxRFFWWjFCVjZj?=
 =?utf-8?B?bEFKZHY3bWN3MHg4T25GVi9Ncm1RdzR2bHd2cUNuYnVDTHgyVWdBKzhYZVpR?=
 =?utf-8?B?ZVFhazh6Tjd2b2U5bTVudFpjV0I3T3Z0ZzhFR2UxOXY1Ris0eDh1U0dVbXU1?=
 =?utf-8?B?bUZLNG1PR1YyaTBXR3JwaVoyWUpGMzlGVWJYdk5Qam5ScjBwSU9JWkZnY01B?=
 =?utf-8?B?YThGWk5pNndyOWxxd294emQ5dWZiWVVraHJEblVGMnpyem5oQzYvQm5MQXhS?=
 =?utf-8?B?MzR1bDhjcnNIMzJYMXFLRTBFWVJhbkNqd2VsZWpNS0tFZTNYWWtZNk5SdWxy?=
 =?utf-8?B?YVRrOFY3WXZyYUg2SXhwZ2Fsdk8yMDVvQ3lpR0l5TFlqSnVoZkxUNTV4cWJY?=
 =?utf-8?B?QlEwVGQxU002aXlWNDlmeVJLaTg0OUxMNXZOSjNFV2NTTUlDV0JneTBzSW15?=
 =?utf-8?B?V2tlVWp0RDNvUk5Dd1VORy9pM3doczhHZ3NjaG8wZnYrb040RDgyQzNHcXYy?=
 =?utf-8?B?NWxyR21uajIwN2l0bVkvYXE2WGFmVkdBZm8zR3pQQ2V0M25yYWlkV3BPOWtq?=
 =?utf-8?B?TG03SGN3ZFp2TmZBOUsra1VCalFyMGtSZCtIR29mc3pUMzRXbmxyYW9SOXBH?=
 =?utf-8?B?NVR0b0ZlT255U01LVyszZS9sWmNjY3dEdWQ3MXczZVJwVVVaT01hbHZJRyt2?=
 =?utf-8?B?VzhyaVh2OEhYYnpENytjMVFFSm5neFlnSXc0ZVJhQUdtdHN3eTdhS2JJZFJ0?=
 =?utf-8?B?NGtUUEY2dG9GL0xSb05nelVDN1l2TVNsQXNFSmNaM0trcFQvODFxWkloUVNa?=
 =?utf-8?B?L1VUQlF1MzlqZVRqZVpLYm1aY05WNVlSeXR2OG5JdkJXZzdtbUcwcjV6Nm5Y?=
 =?utf-8?B?MWFHdTJrZEEzRVZNRzQrMllmNU9laGVscUphaGxPeUU4MXhsandTZENFUG53?=
 =?utf-8?Q?yj+psgNNEMOt2WWPARs8vJgm3yPRrYQlHS66aaSo6oR98?=
X-MS-Exchange-AntiSpam-MessageData-1: m2k4uWJVjWRQjg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1315861-3747-4e56-5e16-08df02ff8eb9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 23:21:14.6192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQnpdXiXDzfGt2oOOFN0xgviuVV3d0jgcl5wJrgoZhytYo2Tc7C/yhZsyAxGHWVhDzIw8YAbaYoBxdR3jJoyMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8882

On Tue Aug 25, 2026 at 5:31 PM JST, Alexandre Courbot wrote:
> The GSP-FMC firmware code lived in `firmware/fsp.rs` and described
> itself as running on the FSP. This is incorrect: GSP-FMC is loaded by
> the FSP, but runs on the GSP as the loader and verifier of GSP-RM. FSP
> secure-boots on its own before the driver even starts.
>
> Correct the naming and files used to contain the GSP-FMC code, by:
>
> - Renaming `firmware/fsp.rs` to `firmware/gsp_fmc.rs` (as GSP-FMC is not
>   the FSP firmware),
> - Changing the prefix of some declarations in that file to `FMC` or
>   `GspFmc` (interestingly some were already correct),
> - Fixing a mismatch (FMC means "First Mutable Code") in `fsp.rst`.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

