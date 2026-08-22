Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012070.outbound.protection.outlook.com [40.93.195.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35055339847
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 20:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787429511; cv=fail; b=EWtMgxqeezpgoqkH9VrM6XprzlZSZDOTMKn8tgnO3cFvB5DrMuw9CLCCG3BtV7FKxiQ/dEMGruTx/05RZuVF+gYMMDbMSPFANxjOGECFCc5aVApy9j9PDxhpAighl6uv9OVQT3lsJ52V0ZsPq/9q0MAZPtTHrrWM/UpY19HXkJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787429511; c=relaxed/simple;
	bh=RxqDw1MN5sn9qTVG7bumhs9OjOmJALK4Kis4j8mc3PQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GaYeyg5vdG4XvyFuEqXd20XiyvZOMdTH+gYQUDHndsaYh+GY0E/yv92bYmXyZuWBiZjvrHta38+McJVDfwW7JqRx7rK8HZfeyyFCRLzNbgkGD+ZekwBIZyRJbRtby4Gy73i0EB4Su/9TrWpSgXGso1IIhwnNSuRV+vG/fOyjj90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GRPpJ866; arc=fail smtp.client-ip=40.93.195.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GRPpJ866"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zt0xeIejArn1LPJEtzscyebMphL1ufcBfZUd/YA5tvfAh6TkzqcUJCpYPHl+B/+q52UtVTwCeXsHovnum4PgRcen5Jfk2aabRtXV/4Scm7rQQkK6LJ4cAztB+p57MsQ2SVjzK0+Rjs1L5kErGEcHf+0xzGWEGQh4nAtJ0SoXzKxMnAPpRt0DLVY6GopIRNkg0TwOTvXPFKy9tJXeYYl7nJN5keGoph/3oDTG20gBXsMuT7eCzh8Bw4/Ty9RH2sTKtD/XjYY3V71br/ZwfP+CYfrx8tZi0KLLRGDhXI84Ujn5LfGI5bqQu61RSIq95mUkaBKMgCz3A0x0Tm78dyreEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMJ4U8sNOC8eJFOjkkTzSKhv0R2MvxgR+Hc0JJglm3I=;
 b=vjSBw6CwcX7I8+Dl7sSDJJcEhEDzKTJADJB7V6oCTOreDyB0fmTk5Aa5aliRwh/XMS3jEHtywZcKzaGxK3dRLM9sznvyJfxRjOwGUbjo16Z/EzLuqRhWGC7RUDvSCLN8gSG9p9ic0ORrx1ds+c00X80KG69YP0jKQkMBE3PJNuQkjK7g9Ih1pIi9y2WWYruuN4rX5XfqhgjDulEHQus0gYhOyzvrd3+9qJvCmp18e5B3kqnUoWsTqk1bIe8h506V2Cqu00dfD98+QigQ3b++tF3NdJuBqu/QNUhUTqkm1gRVXmzFXQoJbx+dLyEDtI2g64GZKBPRwr7fdyh/YiBxVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMJ4U8sNOC8eJFOjkkTzSKhv0R2MvxgR+Hc0JJglm3I=;
 b=GRPpJ866PnpljL5Oz+bbmEneMEWA99AKZGCPjs4tmML95LF6MtYbGnA1TZGtESNyuz5LmQR7b+2toW7YAl8xZFdWFpQ6DtFxrigYbO54JhAlSwigCupHwQqaxYF0vo9CZrjt01BXK+K/qIMK43DEIg1MGtgl9VIAkuPESzRRoWlWAc5eOcCqyGfubhRo37L/6T6RsrV15QQas3zSkNkEBKMD4h5I/GG2hQIq8a5AnVdgD+zgWUGIMYMopYZQPHmE3YKJacKZM1zCgIBLtLpnCWuT7SLZNsdV6lQJKS6bUqk0q2Fx1hsMSzgWm+RHIYRbekvNnRll+h29mtMYqt6ngw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB8159.namprd12.prod.outlook.com (2603:10b6:a03:4f9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 20:11:44 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 20:11:44 +0000
Message-ID: <4a092657-eed7-45ae-a63f-3370c9f9a09b@nvidia.com>
Date: Sat, 22 Aug 2026 13:11:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/31] rust: pci: add domain_nr() accessor
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nova-gpu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
 <20260822015448.238214-2-jhubbard@nvidia.com>
 <CANiq72=Loa21e-pywymk+KcQ+8p8NuqYQc79XDKduQh6f8TnxQ@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72=Loa21e-pywymk+KcQ+8p8NuqYQc79XDKduQh6f8TnxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0028.namprd10.prod.outlook.com
 (2603:10b6:a03:255::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b5b6d76-f154-4f09-2985-08df00899606
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|23010399003|376014|7416014|18002099003|22082099003|56012099006|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	xhoWJJAxagZbsIZin9ROlV/xrQyDqg54Nn0k7Nde1FYni+j/Zqm9DIC4aS76Qk8NTS9XM5mcM8os/CgbLK9ePoP+QX5A0rXxWVkkTQ/3WOa9egmlTTU3XgebOgEEBtwPPaYgqlBstqqTH60vk6WqH8suzzEkryhOVTs9UCR1TY0vFp69tyEqJohw8malXd3aSvDPQKCQ2hEPomgOoITQjAB/Ak+mZ088iKIXixCDFgMijB0+CYKB7oMLCzoaNO5BPbm8RVMlXZPhJIuygzb3oecRs5Tt+NnvsDIiC783KMcOY4zJN7/EXJeE3b9kwQVhVuXp0DapLaqH19M1jQ7QNiWxeT59N2VfJvzhIDNEeTAJwaqWWL4w6cWumlappfXFykZaXHvtclOtHo1wQV/zU/xSCZmccYdw38hZEA8r7MJxOyhEyfu3gqUMOCbL6ugS4TmLk9VmS9DghwC4r2+bULTtOHu0jJWTwcSz36JNS0eiDFZxS+9YN5Dev4LIwu3666ArP2X6zf+4r1iNdir27d//ZA5a+0xkHbVd636jP7GEt+UCHVYDL+XGeXHzLFkCiJCw2PTG4mk+H/MHcqIbwoGy82m25Fd/gQw72H1zrHbjjNBHwIPueqHh0f+9V/JijXM2+gOercAkbj0bPJwm1Y0jKZVVb5qqQebkzLgVKuY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eC96anVoYnc1UnNrdUd0SDJFdFBnbG1wTUhKaFZERDBJTUxoQ1h4eWlPMGdT?=
 =?utf-8?B?cG5UNGdTSSs1R2paM1BkK2FKQXhad1k0OVREU2huMWxkUjZ3b0I2emZwbXFI?=
 =?utf-8?B?QmhzL2orSlZkRE9TbWhuUXN6VjdVS1JqNk9iRU9KTElzNTZsWS9TM285eGdZ?=
 =?utf-8?B?SEFrUFZlQUVpbktJZHluTXpYWFdHeS9GOEh0NUJMejZac01NTXFuTzNFSFRY?=
 =?utf-8?B?eGVDYWdmNnRwQTJCczZjWHAwQkVmQTVlUFlhOXhVK1ZQSHZ2cGsxUXhObytw?=
 =?utf-8?B?SWttMklxY1hCVVNqY1lIL0Y5cG1ib29mc2pVVEZMUjRKWEJVNHRUOStsckpS?=
 =?utf-8?B?RkdrMzRZU3QrTGk4dllxVFFOb2o0K1c5M0JOSzZJN0dhcUVJcHdkdTZiQmV5?=
 =?utf-8?B?ZmVDYmczTTdDVTFlWko3bVBRbGhwSlE2ZVp2L1JJaldFWG9LWHVSQlVTbDdF?=
 =?utf-8?B?Z1UwUzJ4eGpiVG54cXcvbnhMS3FIQWUwTG5LbUpBek9oc2ptZlVGL2MwQWds?=
 =?utf-8?B?c2Z3RjRZbkcwWGZSOTBSQzFtNnVnTWJ0YjdPSEdRdDk0bTA1RzhuS1dsZks0?=
 =?utf-8?B?NU1id0Y2YmpGejdjeURwZ2Z0K2hmNmVHcGJOQWlPaC9Bd0RaL2RqbEVFNS9k?=
 =?utf-8?B?dnArL1dEL2ZoWG9semkvN0x1ak03c2g1bGZhb2hTajhJdWtuRFZFL2hqNyt3?=
 =?utf-8?B?YkF3aVdreXZMNWMvMW1RUStUd0RRMG5IQlZabWZoeitsV2dEZjRoVWdxdWNk?=
 =?utf-8?B?Zmc4QnZXYnVpZDRlWDB4ZXFvZFFSMGNTUHdhSEF2R0FKajk2UWNhNVVERlVP?=
 =?utf-8?B?ZWNFQ0d2Z1l1dktvaVQ2ZkRnSFFtOEY3UlJWY0hEaHljWUpxdGFpTVBtYXdP?=
 =?utf-8?B?bTRHWGFURkxZZzJpSHoySkMwbWdKNjFzajUyc1Y2cE1rNno4L3BrQUZhcFZh?=
 =?utf-8?B?SVNYb2ZIek13NzRwaGY3bzBucXFHL1hxWlE0cVJGRXErMUtaWWp6dGMxd1pW?=
 =?utf-8?B?VTNNRUswbWg0RDJ6dUVMZXkyUWZXeDJxa3ZHbkZyNitmb3M0QUY1T0tXVE16?=
 =?utf-8?B?M08rd1U0ZXZXRW1IS29xWGo3VTBNNENURHYvSzRoUThjQUErWUxyb3pqOGhC?=
 =?utf-8?B?ZUgyNzdSU3BBVHd2OXZiQU9vV3drZkRqVS9PS0FwUXJVa1BIMitVanorOUQr?=
 =?utf-8?B?NDBtdGFXck1VZE5xM2tZZ25QS3NJWkhDU0dOM2Zoa1Jwa1NwMG9FaDhUbGNt?=
 =?utf-8?B?NVhwS01oT3ZQVFlmRXNDQ29ubnJYT1RhTkdRUHZKbU9Cei9NVE5qVzQ4TTBT?=
 =?utf-8?B?eGZ2SXNIaWV2Z0xGSE1PT1VHR2hXeDQ3Q1JPU1BMUTc1ejFTcWl0OC93VDhD?=
 =?utf-8?B?T3lkcENGeEN6c2FDcFhyaG5WVWNzNWNiR04rVisvY0l6aUg1cnpZSzhXanBk?=
 =?utf-8?B?Z3ZROHZycS80SW9lRkVkcEMrczEraXg1V1J1L2R6MnlLbUVUai9hUnhibjlK?=
 =?utf-8?B?NmhwdlFmSnRyWnEwYUc0bVhORERkTGNMSGhrWGloZG1XOWoyMVBwMFIvd0o4?=
 =?utf-8?B?dzRqbS9nV2RWTjNDRjFFODNyb3UrYVpzKytMQW9QbjNCcCtvUlE0cXAxMVVJ?=
 =?utf-8?B?QysxOXEvdlVqRXZiTDAwVXNnRG9vQXkvc1ZNL2gzU05kUjZrcjRaMEJldG9y?=
 =?utf-8?B?SXN1b05DekJNQzZCa2sxWFk1UDIxYzV5YlVwVDZ3d3ZwRE1xTEdCUjBxTGxt?=
 =?utf-8?B?MWI2NDdqa1RKMWh5M2NWZ0lXRHdKWlpCbW1HSnByaHU0cElCd3ZDOEhxZC94?=
 =?utf-8?B?c0k2TW03NkExek44WWxNWTN2RjNtK1pQbWJXTEljdmdvcEJ2VXNTdkY2TVRw?=
 =?utf-8?B?Wk9mZ2NwemZNemdRbkNpYmxoMzJJODN0YUhjMVZ5TWkyeUZvMUp0R0xpR1Ey?=
 =?utf-8?B?NzREamdYaEZsWk1WWGhDTzY3Y29vUytWV0hwb3hQNU1UZXd6TkFpWGVaekZH?=
 =?utf-8?B?S0d5Ui9SZW1VQi9UY01UUmFqeUQrWlBUdHBzN2FiekNyT1oyWlpSV0ZTY3A1?=
 =?utf-8?B?RGsyS3M4R3BiTTZYLzhSUUlzc2VFbEE0S3VuU0xBd09CbGhva1IyQytOclc2?=
 =?utf-8?B?TGZTN1REY012YW5haXFsazlDMVk4NktnVFpSSjFrTW5tQkpEZi9vdjdUYTUw?=
 =?utf-8?B?UnNyMkx1TnNuZEdLcHJRV1FuRG1uci9oTFpWYk8xWTVVcldwNUhSK09NZjBU?=
 =?utf-8?B?a2xGMkxSS01xVFAzenFla2dTTGswNFBpN05BU1gvbThGc3RIa3RlUE5mbmo3?=
 =?utf-8?B?dDdTVGRZUm1Xa2NORFpxTVlnanJrd1VsdHc2bFZxdnVEQ0xJcWhQdmpGV05I?=
 =?utf-8?Q?T+5aSAozoOMDjv+E=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5b6d76-f154-4f09-2985-08df00899606
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 20:11:43.9046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BCCf1eJnHfKMSyr9Buk773O2A/GxO7jG44crhR2xODHXHoijimzlcbgnPHyN0wbrFCjvBvR6WW0P44vg7vmxFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8159

On 8/22/26 12:57 AM, Miguel Ojeda wrote:
> On Sat, Aug 22, 2026 at 3:55 AM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> +        // CAST: The C function returns `int`, but a PCI domain number is always
>> +        // non-negative, so this cast will not lose any information.
>> +        domain_nr as u32
> 
> What about
> 
>      debug_assert!(domain_nr >= 0);
> 
> ?

Yes, good idea. That's appropriate because the PCI core on the C side
provides a positive domain number, and the Rust side can assert that
that continues to be true.

I'll add it right after the "let domain_nr..." statement, when I send
the next version.

(Although I would like to figure out some way to get this in ahead of
things, one way or another.)

thanks,
-- 
John Hubbard

