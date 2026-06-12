Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012014.outbound.protection.outlook.com [52.101.43.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7247A14A619
	for <nova-gpu@lists.linux.dev>; Fri, 12 Jun 2026 14:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781275917; cv=fail; b=a9A/jRDxbuj1/kUAKPPmWsvCH8ZEZgMsJTfdX98dfwiCdc2eHXAhQ9AFj+yCRXtTJSB9PT12U1hidJjBrDIVTT7mFOH6/5Qba8F4Wz62lIJHMCavLLe8f73Y3CaTjOQH5iJPSBEkq8epd2Of1nKF6eH2HhQgjTOaQQLzmug43fY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781275917; c=relaxed/simple;
	bh=7HjdRHm6pcG3C4woPGbMpAnqY52cPc4wPA9wvSY/RMA=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=F/p0zRy74q7LoJG1UipDOhhtAE2aJKSY47FUQpJBKpMPQ5ju5erxHNJD4jKymkMqGepEGrbZVj+mx1jG3YXWzudK2wEbfSKpch+kLFUnohT+UMZnbDeJqEq8p0MofuZ4+MoWdteNF/VFlkYPg27cfVkxo7Qp5oZ9y93IAJlJ5ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KOmL/1CS; arc=fail smtp.client-ip=52.101.43.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KOmL/1CS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fD0JzxqLiM/lRuBZWP9vAjdVwpMAQ1tNvO8QAFSrUq709lAbmcsAYLFNHYtvjkKPBOsx9UBUt73EvunviSD4TY5T+Xeq3FZ1PoqX5HniLvnBxDXC7VkoDphYPPahVlUwJk2JPgD6LaXCrQxBm7zIkPAg+WiwDEpBkSJlSEC3SQF20jnPQcmUoZ4zxu4h4+NCGYlzeKDnh8mB828BVcvEl+TEpHa1RC6BFPRMpHLJ8+m5QwCWyMw5ZAXWK4DocLvXi9lQV+vzEo/aE1oQ+Ifebg6q5Z/YQm5t404mZdNOhh49bMv9AH4NXJdS9192NpIg5qOmsMrw8KKY7Fb4J4IWEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMfgljf+OKzk/T6CLVYa1Fnn3Vq/Vci7tJ5ANjjmxhw=;
 b=saDHcgSu1AutDfWf8zyu1AJCHquEatiZdOgwvT+ba+OirzbcdAd99V+mzAzDD0xvFNTRfjw57HBCHfoXH14bx82a7RZydZEVVNqdGaVGWbv5Wpa1xY1R+TN8fUKrVHQFHzsA68PuVCC3HxCxFRDfwqcgddBDvNYnIp2k4VaKc8yxsp5Gr8UlDr6aYi4eK+5R5SIJe6XC6ATIKR/z+30VF4bvnRbFHbNQkzviCv29vmSLPjXW6zYBTGDip9C8wNNwrQlvSiBhlv8V7LsCnA/rYomTGDXkoM67sgQ3UPTAqsyEo7xqyfyzoHDtOLKPmPEsCmqQ6VB56SNiM/j+F/n3ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMfgljf+OKzk/T6CLVYa1Fnn3Vq/Vci7tJ5ANjjmxhw=;
 b=KOmL/1CSWc47xNPGaR0NruTuKutJONDa65VmplUKZTdoqsP0aTBtT8ztPqM5sgAm7WnsatsIIooEQYPIfh68OvpYJpEYCLY8KaawnxjUeF9ZtNm/Ouy2mdUk5zRf66w9ADouxI8lCU5yPMbp28Xm+hYUTHTGzMIifKwDJ+NsOQfL/eFtXf9qSoulcdgBaCFiyuWNmtmRSuJ6t0peIF5wUhmFpZrAlHRkxkY/PuWdx4oFeipZrlc8WtXVR8WGk+V+Ok88M02x9cvgL9Q7ugss1XrfCY34mcK8yD1ZSe9w8vRKB2K/4nS2/nNkoKu1Xcf7l5JcCUeLmcU6b7L1KAhslA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8030.namprd12.prod.outlook.com (2603:10b6:510:28d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Fri, 12 Jun
 2026 14:51:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 14:51:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 23:51:49 +0900
Message-Id: <DJ75LZZNNA4Q.31JW6HJ9430L5@nvidia.com>
Subject: Re: [PATCH 1/8] rust: firmware: add request_into_buf()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 <nova-gpu@lists.linux.dev>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <zhiw@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-2-ttabi@nvidia.com>
In-Reply-To: <20260610174929.744477-2-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP301CA0066.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8030:EE_
X-MS-Office365-Filtering-Correlation-Id: eb69883a-c167-47ec-b6a6-08dec89223fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|23010399003|366016|6133799003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tOhHz+a9W1MxRNFlFAmLbtb8kxSbV0CleXlXSM/P+oDke40cyJcg9AQihvAmuOOk5vnTukY+7Y477MqgEO6/sVMRDkvv2WPaju7lGOlWqSQ4C1NT7MnkP6RG1Qd8CJsEHVWE25XLnOddMjSW/k5MLe+ngWnj1xBlLA/EgWij/95RJitE7wv053ObDGPB/6S/rBRE/bb+SW+lrIfmcjHgengugN1O3DZT6TWt3akbvZsBcj+qSzWMPllTQToEDjQxQo8mUp4I7XWIv2rEawJDzVYUuM7B7Wz9AuLV3duIOsKsuVZbu3HCnfENN6QiKqEMtQPQY177SJz5UFYgr5n+o1v3HbKhSqdf7xFBN36pmHskJHKbVy8Crx5viEt48V6zCf6TfqQVRpAVgqvs4gco7IY8sBY3MMzp4qWNWtJnB4zvIAL306Ytu+jr92nAnbz/8yBOvhPJu2Ycg4snmpUrh3dYjgFPyIFH6a7yn/IWWc469RWQ+H7Oy8i1ePr+xtp/ZJnRM0z2lU3MMD+YWeUgvc7yIuN8w/j4V5iPrm3XeS2ewfZnnIfD3aAUDH7Zi5MmwJBibjllHwHGQ97lxmPeXulSXzeU3xViGK3mGUO8uzD9+pnxcl3rK8ZU2kbhVXEwUwmcJ8FoCrqAusE1qw07Qn5UQ7lBEembHro4SZiVRB28C20r/4xmtLMhjpQiFiMV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(23010399003)(366016)(6133799003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0F0aGZndWdURWNtS3BzajdWUFVFbGcwOWdYd09Hd3o1ay84R2Y2NEdFNmRW?=
 =?utf-8?B?bnRVVUxwMVVWTW5HdGZpWDVxekErR05RVGFRZE53OWk2K0VnVXBmUUpiYTlW?=
 =?utf-8?B?bUVuYW0zYm1XK1I4Q0VNRnFNUURST3hycVNMR3VZaEQ4dWxJR3ZjK0YrRlRK?=
 =?utf-8?B?T21veVpKczE1alRDZkhQOUZNWGVuSjlaQVNaRUIwZkdzNkVJQnJLM0QzVTBK?=
 =?utf-8?B?czJZaWdRWG41SzFTTEFCdmt5aGxOSWQ0SXAwNHJ1Zk1lL2NXWktYY0VVaEJq?=
 =?utf-8?B?Lzk2azBvQjN6Z1JVMGVMaFVxbEpVdEpjNm9DSXpHYnpSQitLK1p0YWtXbG9a?=
 =?utf-8?B?MytKb2VMRU1BZ1l5VnhabFdabEdYbWYrMlp2RVorb0RPcEw2NjhyMkwyL0di?=
 =?utf-8?B?STVLNmRaMm5oQ3R5WlovZ1NzUDVJT1ErWTF3U0p4V2Z0Wk9HNS9Jb1JJK3Rq?=
 =?utf-8?B?YVB0Um5BUkVhOFhvNzNVejVDMEZsQlNrM3NaMFozejRzcWNxejhZdFhBVEda?=
 =?utf-8?B?dlpPbUluekc2SVJVeFdaMkdERkdVRDE2T1NtaEQ5MCs2YTZqSGFaeWFsZ1lI?=
 =?utf-8?B?cmJuVVhkdHpxWHZBVVdha3drY0FZd00xeE0xOEtqUkZaSGFWVXZjQkRJTFl5?=
 =?utf-8?B?YnphUWIyWEFSZDdkUWVma3RWRk1YM0ZQUjUxREJEQ1YvT0ROUjFZUGVuMVp0?=
 =?utf-8?B?Ukl2TEZxM2I4LzNMSVA3N3FFMi9IcUtoTHh5Q01sVVR5SXFpN1hQZTlXa1V3?=
 =?utf-8?B?RzdlT3p2c2FtdnZtTEtYS2JJUGRveUxYaUZsY3g3QTRkOU8yZFJrdGtuWCt4?=
 =?utf-8?B?T0F1bTBsaFlCK0hENE4reDVRR1duRERMeDAzakVmOXA2azNvaGYxb1NnaWZo?=
 =?utf-8?B?MzNsRjlYaCtBdDRpTS9GZURYWWRXRDBCLzlKNlIxREFtTmZZSzR1M09Ja1dQ?=
 =?utf-8?B?UFpjeGdUeHRBRVV6UldhVXRLS08yREFMZXFjOEpXRlZGYW1UYTNwK2J2S24y?=
 =?utf-8?B?VlBtbjhjdVZ6T0ZMbEpPaVBob2szK2NNZFlNTndQUUhSRENMd1VUbVVLZlZJ?=
 =?utf-8?B?WHYxd3NhY1NCaTB4emxFOHk3eG0rNkE3QkFlcFE3MGpqcTJ3YUR3a0RoZldU?=
 =?utf-8?B?U3ZKMy9TK3NsSE9nbjFleHIrMW1MSWR5ZjZOVzBqUnYwU0RuSkZoeW5nRlhm?=
 =?utf-8?B?WTlJTTdBbVdIa01MayszRGtDQ0crYnNnMUFlV0k1dzE5aldEc1ArSVFtUzNB?=
 =?utf-8?B?ZkpUSjl5WFM3Ti80c3FndGR3UmdNRUlxNWNLTWNwL2JuMlZHMVJkSEJSRmtY?=
 =?utf-8?B?dHp4K2plbHNocCtVZTVpc2E1Z2VJaWhzSXRXbWgzUys3OWZaMEdhOCtVQ0l2?=
 =?utf-8?B?dFlzK0VHMDZMRGQxMjlRdjBFSHkzOVI4ZkNRdy9ibmVRSm1mM2d1QnNvWkFM?=
 =?utf-8?B?dW02VUtRQ1pjTmdvVFdjMDVXMkpwZlM4VDNPVUhHSmlHVUpvTWs0Wjk0eGNi?=
 =?utf-8?B?SEFDVEhKcFBWUlRLdTVoMUVzQkNvYXZXZ1c2YUpsbXZLbHVUK0tWMURKYzFK?=
 =?utf-8?B?STArRTY0S1lpemZYSEN3Y21JODIxcnAvclhvWnlVNloyR2I5d1hHbXBJTXJk?=
 =?utf-8?B?U1ByTCtvYkJhdFl4R1hCb1pPbENkQWc5UktSemRrV0hJOWZ6dnRzSG10V0lh?=
 =?utf-8?B?UFlLUTcxMStOWUo0KzVxalBTOEJadHI3UkpBZjJmQVFJUWs1MjZQUEUrb3Vy?=
 =?utf-8?B?VnNEdFo2YjQ1YmRyNVpiTmNGbE5TYXU3UHk1bHpLWjg0NE84MWVlUzFQTkJx?=
 =?utf-8?B?a0NNV3dFQ09FTUZUZHI2MUhla21aQWJzbVpiVTZzYXgrbXFIaUxPNnFPYVJL?=
 =?utf-8?B?NVBuQXoySEpYMTNlYkY4c0owVkwvVjRaMjdmNDNtRHZGT0J5QkFXU1BzeHk1?=
 =?utf-8?B?TkpIM1NKYy9vOUhCR1M3ZnUzS2JaRm02ZWZBWnhCa0Fadng3YkJGakcydUxF?=
 =?utf-8?B?Si92aTlzT3o5bzlreG1qWlA1VXdmQXYvcGJMN3czd2plNSsreHZXQlZZSTRB?=
 =?utf-8?B?eXg5T0VCZkJ3cWhYZzhnWHZxaDJyOHh1a1k1b0NRTkhuOVliQU42WENZcWZ6?=
 =?utf-8?B?WWoxcVVjbHdiMEpVN0dpTHFQL3l0aW9qMnhuSXJ6TzZtUlZrZ1R4Lzhzdzlx?=
 =?utf-8?B?Y1JuUFQrSVFrYS9MQlJuYkZpNmhDSmg4TW1Da3FWcEFWNXlyMVArWXN0OFZN?=
 =?utf-8?B?b0U0YlZNTGxRQzdvT2xnc0FtejBrdGFqNHpoNitEK3FmTXJhTXkvWmxWK0JT?=
 =?utf-8?B?WjJPeDhka0h6WG1MaGsvN0ZNaEV1cDVRTXAzNWhHV0xkVEQyNG1hWVFueUNS?=
 =?utf-8?Q?iHqcRHt3M8ItBt9Ou7U8W9aynn0zVWCpFmNet69HoJdtf?=
X-MS-Exchange-AntiSpam-MessageData-1: cS4wpZKzOuz9+Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb69883a-c167-47ec-b6a6-08dec89223fe
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 14:51:53.0347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iv85zDKWb0lr+Ml85DAHJMIzmCIOz7o9gsTGg7Ku6GSF9UJwV4tcDiXpYP/Hf2B4J+qoYw5yuDCQqR/4skJeyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8030

On Thu Jun 11, 2026 at 2:49 AM JST, Timur Tabi wrote:
> Add request_into_buf(), a Rust wrapper around the
> request_firmware_into_buf() function. This variant loads the firmware
> image directly into a caller-provided buffer rather than a
> kernel-allocated one.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/firmware.rs | 45 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> index 71168d8004e2..d2ffaacc2d43 100644
> --- a/rust/kernel/firmware.rs
> +++ b/rust/kernel/firmware.rs
> @@ -120,6 +120,51 @@ fn drop(&mut self) {
>      }
>  }
> =20
> +/// Load firmware directly into the caller-provided `buf`.
> +///
> +/// On success the firmware image has been copied into `buf`; the number=
 of bytes
> +/// written is returned. The caller accesses the data through `buf` itse=
lf.
> +/// See also `bindings::request_firmware_into_buf`.
> +///
> +/// This is intentionally a stand-alone function rather than a `Firmware=
` constructor. For
> +/// the `into_buf` path, the firmware data lives in the caller's `buf`, =
not in a
> +/// kernel-owned buffer, so returning a `Firmware` would expose `Firmwar=
e::data()` as an
> +/// alias of `buf`. Since `buf` is `&mut [u8]` and the returned handle d=
oes not borrow it,
> +/// the caller could mutate `buf` while reads via `data()` are outstandi=
ng (and
> +/// `release_firmware()` does not free `buf` anyway). Releasing the book=
keeping here and
> +/// returning only the size leaves `buf` as the single owner and accesso=
r of the data.

I think this last paragraph can stop after the first sentence - the
stand-alone approach is the correct one here, interested readers can
dive into the code, but this function does not need to justify its
existence to every user.
