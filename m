Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013061.outbound.protection.outlook.com [40.107.201.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1662B374731
	for <nova-gpu@lists.linux.dev>; Tue, 22 Sep 2026 01:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790041869; cv=fail; b=o+VTtuII2zgX6aLK+Y/Nic0Q7YjOUZ4yaKODdxRmsJWa6gR/G42cNbq258o6TdTR3+MggWVIrF5GgabAYcStNMpYGl+Lcycde2sUAuyFfYVWPWbZH5wtl9wFiF423OY+0ya7yAj1lY3k2w3rFnb7YpNJK71T5BJjqm+Bc2AqffA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790041869; c=relaxed/simple;
	bh=jBrJUVkAINxvLcfw2idq8eTvzlOHQ9UClMONI6MMvrk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=toxjwOVipSA6OMqzp/hUcIeK+qd5/AQ1U7IDKeeatBaj7KIIuUInA1aqZ8Go1fRpPbgmUQYkrpX2DRq/guJYzbxESxgxv8wfv9RoKpt5iD9/8RhNkDG14ohH2kjUpA18FbiyGMk5yCpM4WEHXl7seWoNiBT8cZRvq4CQ3DfIqbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uUJQvaTk; arc=fail smtp.client-ip=40.107.201.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uUJQvaTk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSoNcdShQoOFHUfhHUehTjnJunPA7PqcJbClsgn832q4EIZa/3xvBQ2VzCaOrEnUwoDDGjPxXCa4ztDBxhu89XApIsjKlEULRyhu3XcXXvHNt5Mm20wZgiiaZuAjNGwUFMi+D0hhwIcC/2VM4U/x2V4FgkzdUtTWsdFLFQoxCS1kEFRaJDSBw3l9+8AWrj+NhymowjIj8Uce9Yfq9QcvnO6GS1k5AlTqOeGF1vKoy0svba66AoHq1xQ8DV6L4xgeUA6A71DFea8EvxIU+a8JDRcKLsWrwEb6KQbbnjk4C+cZOZBRCs2YnHEaGr+TJkxCpyz4XuFlj44lvarHQRMmrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NnRU3k4l47wJ6M+cjFL7/X59MHH3dTMGYvWumthVgAg=;
 b=lmXXijU9OKI4IYfnxfEgSCBtietpQTZAzdwj2CGO+pEoDoPvUOwBW7yCFCe4ihChlIhhBwpAH74tkT1VAdOuj76rLW5vDBlgxCSkuz1a9ebSLQNxPsBP1daCmdHPdcGdpXpx+CZtlvUJLiCYVPv1MbnDPy5WjTnEmXhfaqffelO/MrLJ22SwMMS+pn6jBqQA7VDtgb87g6p8P3O+cAJvtPLUQQ235LgIW+0HqzWHownaf52dH997D6BuYXGcdOxLgnsT8nJJbQkiklDwlxi63Q2OeChXJeeU47g/jrrqoWqZWPDeVnVfCSUZsK35szjL9RK++AjDGfsuK9KxE/IC+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NnRU3k4l47wJ6M+cjFL7/X59MHH3dTMGYvWumthVgAg=;
 b=uUJQvaTk5jyEKcfktspVI6LYZDFPqQDsvaBAXDtuE8stXaH7NAOKFo8y+EIt90zRAZP1OwfGDShPBFWSE/u2wvAcrvStzohuEejLuA/LXbC9Ai07I+jsxgHfPJySUNbIU+S/oMl8PXpH7uGRDnAqytIKTi/5dcjLT13eU/Mg+Z4xtyM1JfykcVFFHa6PjBdK1bkQGRxMeIVeJXSHYyA7LCBScHOjMulQrfPJZTK5Srl9HyDJoXs+voIAn0RVIlXenClCax1CJ9ZZt3Jf4IBc+J+cPVkBPKalGq/8+cLu9QrAWn06oqLBn41Z02LXwNDNDE9kS45YugLmDhBWTMuXEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY8PR12MB9033.namprd12.prod.outlook.com (2603:10b6:930:71::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.16; Tue, 22 Sep 2026 01:51:04 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 01:51:03 +0000
Message-ID: <dde469d3-aef5-4fd5-830a-6b92ca9d7515@nvidia.com>
Date: Mon, 21 Sep 2026 18:51:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/33] gpu: nova-core: firmware: add r000 bindings
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
 <20260918010719.1176945-5-jhubbard@nvidia.com>
 <576a2ec09fcdec7d3229bb30eac433c4d601e5b9.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <576a2ec09fcdec7d3229bb30eac433c4d601e5b9.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a03:505::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY8PR12MB9033:EE_
X-MS-Office365-Filtering-Correlation-Id: 703ef626-c279-4e5b-128b-08df184bf5b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10067099003|11063799006|18002099003|22082099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	abDlXkpVOzSz0ITFrZuy12qpkzwgcjgzTX8QWGFhs4hGjEiA2F3vOMOK9wh2oulTW0ap5ZAkJUlevu5A5lTVSWjduSCDg4WgobXCsxD5Ywid/Sc+Hk8KfHgRHruxfZyYK+0mb9NTXWLDg+pyxhCPbt8I/sC+GWg58gF9qX0FfnFRGwacL5rGqhJMn/6cFgIKzW1dXKWUhyOCCapZJexWBChmLVKatwiE1ZGm+VkYtbEdwleZYwZbnM0WFQochbtWBBkUKjKFV2gZZ0ERTjq35GCBSBPM1Q96g8mUF9gEDB6k07XAROehPID3vc5flmi+OofaM/KJYQLNKPqNnZFrmZu6G52usJT8vqgJMg3hKyyruxOtICvC9vP9r/kzaUJ2Mu8Go2us7GatXPsf5Yy0mFzfC+nYBmArZHJO5c1ez0J1IQvXdvlzLYa78WQ29wv2V/brcMrq2O5shfqkfxHpo24VhYxT3ILGaLEbqLPpgWeHTMkGnzbQ8Trw/0NSdO7I7TiSHDZp34pSZjanfioH9pE7XsL4+kC5FX/Cub/I3sC1kzhUjU/S5UT3vUKvo2Ba3+viCEeFyamAcnGK18T0rly1deubg/x8XDNZhuVVEBAQyK+WOqT2UqW+gjcQp7PP7MdM+IZdPLVbAHIPBRJbmqezCLPqAQp31211L3DaUYI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUJmNEpCeXZHaTN2b2xYbXJjdkpTbE9Vandjeis3eENsbFcrSWFUUENQanNk?=
 =?utf-8?B?UWtCWjFvaVBhSUlTMmRmaTltOHJaMnIyQlFwK2FMTkppSVRpTDJicE9ZSGt6?=
 =?utf-8?B?NWxnbFByYmpQMC9CbCtOT25WbkJaRitwODhJWS94cGtPSkdWQW9OakdseXVV?=
 =?utf-8?B?OCtGcDN6eEZod25qRjdLWGRTOUR2aUFMcHVsUFV4b21PLy9kVTZ3Y3NobFJ4?=
 =?utf-8?B?ZkxMUThHRWpxb09ZN21aOU9MejJNa0RXQ01WZWo1dW1BaTUvSTZwZkw2b0Jj?=
 =?utf-8?B?NjN6NENCaUNFVk5NS3l6cC9tc1hnK1ZjdEZFRUVhUE5CYW5YNFQ1c3NHMEJ4?=
 =?utf-8?B?MzBVcjVEa2FmTWRldzBUaXZJZklaRXE0ZGh1T3FGMVVINkZOT2I4TE5ORDE5?=
 =?utf-8?B?dWNQaUoxbm40ZUFZSlpPV2ZPY2E1eEkxY3o3OFZjSUZNc2swV1gvV1ppRTg2?=
 =?utf-8?B?OW1Wc1B2eGJJeW1JMGg3eVhQSjJLZ0Z1cmZRU3ROcUptc1plb1VsSjdUS0pW?=
 =?utf-8?B?QlAyR3N4VXpjM0Qyd3haaGxtVmpSUERrd1hNeTVEUmxMY2xrbW5kdUZjTm5J?=
 =?utf-8?B?MWdGeTdYaFk5c0dLSXZxWS9hYjVrNVhNZ0grSGdVd0pFR3lXU1AyMmJzb0lr?=
 =?utf-8?B?TEx6cTV0SEsvQ3dpNWYzaFVCTjlhbzJsZ3RETzc1ZXNSYnJSUTdjUHF0cC9n?=
 =?utf-8?B?VzNkVDdJTVE5NmRaNlhFVDVndjl5SnFDSm1aVmNXWFBTbUxNWWVTOFpBUUdW?=
 =?utf-8?B?N0UwTWpMZGdKbDlYWnZFNVJqSlFENjFZd25VanNtekcwOUFMN3VzQk1xTTNT?=
 =?utf-8?B?dDNBc0t0UVFNZXJ6SWs2bHdQY3h2TXdyUWhtcDVSSVRUSEhkMTFlUHlFTHhy?=
 =?utf-8?B?eG5SVWplSGNhT1JVbkVFZzVmTmI1dis5WlV4Q3JydFBVMS9PakxKVHAwQmM5?=
 =?utf-8?B?bTB3b0VBNmZYRTZmck9lbXZqcURmYW9HUitsUDBtNzludnREMEhwWmVJMXBy?=
 =?utf-8?B?cy9kRjFDVXY2ZkwxTWZ4MmJhNDJNS2dkbWcwK3NHbjdjK09xQ0VyTStLcWox?=
 =?utf-8?B?UlN5bU5DQzArdkdRNVBtbVlEYVNvblo0UTJpM1M5NEtQQTZ5b3JvQUhmd0g2?=
 =?utf-8?B?dmdzeHZFRi9rbzlFa0liaXNISE55cEJrZGhzVDh6U2J5Z09tWGtONisvckhK?=
 =?utf-8?B?YjlJbEsrY3Fxbm5BTXlZR1RWMGw4MzBURmJ5YjBnbDByU3FvTHpnTzBWRWpS?=
 =?utf-8?B?WmVybjhRbFM3UGZxQzBUaE5OVDdINmtSZlJLS1NhM3lzajJrUGJtQ2ZPd3B1?=
 =?utf-8?B?SG5heFR5b2RjRWx1OEl1QWZFeCtZVnF1R2x1RmdmTkxqTjI4UTMvcXBJdzd0?=
 =?utf-8?B?WmMyb0FHUkNiOWIyQU1sTFhFamFrVktWNnNPNllpaWdrUlprd0ZEcGRJRW5K?=
 =?utf-8?B?Unp0RGE0SDZTb2FHWmdIVkZYcXNad2VkSlltdTFvT2xRbm5GNUZKdHFFRW9I?=
 =?utf-8?B?OU1NREF3VlljN0NwQ3R3UC8rQnV3YzVkS0ZTQnRsanh6cllMQm5VQ1BDOVll?=
 =?utf-8?B?QkNQQnBMbjRRV1JWWXJ0ZmJuR0pudEM1dXJMKy9XWE9PRjFDV2VGTlp6MjZs?=
 =?utf-8?B?WEkrcDlxMFd6enNsanUycFIySWpIWkVxQncxT0dZZTZZdDVvZmJIcnhZMkVv?=
 =?utf-8?B?aXhvSzVRWENIZFFzdjJHWklZRmRLNGVCRU05ZFI2UlhWcHNLWVIvK3hERFpC?=
 =?utf-8?B?QVFES21KS3lNVUN0M2J5b2UxMGxhNUM1RnBOZ2JVU2hHbkNNaUF3Mk9sclBj?=
 =?utf-8?B?c2JPSDJuek40THFseEFURXZtZTJWazVTaVpMR2hrWTlyd1RRbGU4emxJMC91?=
 =?utf-8?B?WGdUWExBUDZkMG9wcDZ4bDRUZEsvZndHSHlVaTNnQmpEOWdvVnVaS2E5cUg3?=
 =?utf-8?B?cndIaXZ1ZGIvbHdVZ3ZpdnQxMU1QdW1CdmFzVVVqcG95enltcjlPVjJ4ZzdH?=
 =?utf-8?B?MUVmcFp6STFRdUxkd3VldlpNb1NzRkpNQ042ODhTUTNGRVFXTlhXRGxuR2lH?=
 =?utf-8?B?YXhkQXAzOHh5TjlBSVZGMzMyRk9ab2Vxd2VxT1ZzcVY1UjF3Rk9JOEZxcXhj?=
 =?utf-8?B?c0J4QVlwTGpvaExVclZhTVFMUkdkeUl4R0NuK1VWcnVKdHNSNk1pQXpxSmNz?=
 =?utf-8?B?REhVV0RzcHNoNHJWNjluVW96UUFXekNYUVV6NUhPSzY3U2x0ZHRyVjUyUThC?=
 =?utf-8?B?bjdLQXNJb3dIQndPNlNOS1oyS2NjMjFkTUdkNU5ENGJoVHpsUHN3TWRWdDFP?=
 =?utf-8?B?dTMwNElFdWs4SWFEZ2pITElZV3NnVFpDamEzNHQzYW1McWJkcU56UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 703ef626-c279-4e5b-128b-08df184bf5b6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 01:51:03.6136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SxuKmCRa1PzvYPWba5Q/tTIXJETBByR7IIhYow2FHVXLHC36Kb/zH7wUIldZL+qpGD/DaOV5C6chiN6jaWGTzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9033

On 9/18/26 10:42 AM, Timur Tabi wrote:
> On Thu, 2026-09-17 at 18:06 -0700, John Hubbard wrote:
>> Nova-core boots the r570 GSP firmware, release 570.144. The GSP firmware
>> releases from r615 onward share one ABI, and their firmware files carry
>> no version number in their names, because each image records its version
>> internally. The driver calls that ABI "r000", so that its name does not
>> change with each release.
>>
>> Add the bindings that bindgen generates from the r000 headers of Open
>> RM, the open-source NVIDIA kernel driver.
> 
> You should specify exactly which OpenRM version was used for this, because I suspect that some
> of these constants might change in future versions.  The upcoming NVOC stuff will mitigate that,
> but it's still useful to be specific, just in case.

Yes, good point. I've verified that the bindgen with the publicly
released r615 provides the same thing as here--as long as I delete
one unused item from bindgen input. Which I've done for v4.

I'm about to re-test against stock r615 firmware, which I now realize
would have been ideal to do earlier. I was feeling less optimistic
about it at the time, but after looking at some details I think it
will work for this patchset, just not necessarily for the follow-on
series that Zhi Wang is posting for full vGPU.


thanks,
-- 
John Hubbard

