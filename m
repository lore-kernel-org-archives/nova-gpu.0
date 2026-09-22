Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011062.outbound.protection.outlook.com [52.101.52.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB97A38F954
	for <nova-gpu@lists.linux.dev>; Tue, 22 Sep 2026 02:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044499; cv=fail; b=t9zOGML0mPlLxVmtj6p3kR/XKJDRxhMbrJU1+pE+VsVGCpJZfzHO1zQJIxmJUAJxEeY2OGHwVyjed/aBNOQy+9Fdo1oT9t4CSbW+qHeel/oB5wjfNmUQT3lAsmDSTxFM04WnCDcHxnoyQ3iCIjllmxUe1+HoW7/sTB7WwTk9ino=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044499; c=relaxed/simple;
	bh=rjauAyundCD6RIPGaAe57rL11ymdlnn40+sJmHc2eN0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eiCoiAAx+ea/L8sALe8iCCC3/unB4MQ0YeH1hxU4a5w/lC1HKA+L985m9SUOgyJ9kA7sTAq5EpsHTwhWZQqwKvR2NcUXXduazfmtOJDNOVEwJQ532YP+WuoMCmhd6iIy4kCd02uPl3sJiOgDW5GNM8CvuZ/aqAun5VMVH2iJoY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sevSikWv; arc=fail smtp.client-ip=52.101.52.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sevSikWv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWDPZYqeUuTeqOmCZViJb9aZzhusHzfdCo1FIZSfDgLaedkINCPlCigTxNOekMgoW0RdGuLPP2gdYL6fkLbtd2a5EEg2qw5PKTIgQjGbCvwWC+rzMIbAk+DJnnquuKZ9qwv8spWUU+VI60QAbOpxk+pWXgvsdafIypgO74W8jbw/A1i9FgRAvL0c8PjuhpINpfFeSuuRQOdskO6arRYkhXFumiapVeP4XSZUxNeUbPfQfWN4bR0l8k8NKIdu5Hq2G5tWQCxtED/yKcsVvLn5eAb2tsHJQL/u4FhmfWZcY5Ayo+KFe+CaX0Ehh9os/2AP2K/zfXzCGoC8egwIJ8FVeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KJUuAJIlTlTVnaE2vxkdlKubHpP+DnWynTfu3/HqKU=;
 b=eWajD2qlSCIHcM3oYwsCNfg50FEOUCNz37nekhOfjc9Ltu8k79GM6QYuxq2ea8L3ttALqQJVOgJW3PO7PXpRiqgmsQu6QdC7GgLaKM+je8hFKeWNBpw1gPJgmV88f5Ep4jfkotGO50NZIs0zQT5ElKFWCTXEKbM2/n8xXjZAhgcWVu/iMiNan0iUtj1sipZOKkmrS8r9PDjahrbygIq/9reajFkFdJkwYKeK3qIR5U3XRTowwgp7ziKwyWlufGGutrtc+Eqxb+Jco87FJFpyh5lcokzdTLl2FbSY29OxlWh/TUtpOIgojmJGLj1lU2ov7O0plZCVJumGbzGzQi3Pkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KJUuAJIlTlTVnaE2vxkdlKubHpP+DnWynTfu3/HqKU=;
 b=sevSikWvuRGm4WAGWK5e2usRqtdW6uL2w2lLtfQ2R1fPnl/YGJJ3wrL6iVv2QXPpQXMmaDSt0iAXO3jwa6FQRRFxLMg0FHwmXBMqIhkY7s8cJrZVt2Y+rxpDJnP2NgZi3dA3GgI2jG4Shg7I7HstVBAafA5lfQS1W1RPWBpdk+FDwaCDS/PZl/Bwl2ipcTQxAjTXE8VOeQm1p71Hfu6QR7pUMI6ntRSUSUKYHjXF1Jhtqj7fUBIktFzp6Xm/x5MGfeEHJ2tpRcULd/XYGLrFzt9y/MCMmSAZvNfpw6kx6NBlELAuvXwe0MZwnyh+SUtQ953h1qrYWh0ttKlUpiHcdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB7750.namprd12.prod.outlook.com (2603:10b6:208:431::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 02:34:54 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 02:34:54 +0000
Message-ID: <66c47864-5786-4751-9507-356ddc699e70@nvidia.com>
Date: Mon, 21 Sep 2026 19:34:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/33] gpu: nova-core: add LIBOS3 log buffers and state
 monitor buffer
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
 <20260918010719.1176945-24-jhubbard@nvidia.com>
 <f8b2871a93e71d4ab56f5d7ba6a23600c044b025.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <f8b2871a93e71d4ab56f5d7ba6a23600c044b025.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7PR17CA0060.namprd17.prod.outlook.com
 (2603:10b6:510:325::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB7750:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f7d402b-e98e-424e-08c9-08df185215c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qMFTq64lqBN//MWVBLYChb7l0VPdigQCsajQ+qWFZozkQKnNni1xWo9ZZ0E0ALvJnPa71uqTAGnlXhGQx9QHBGnZizoAw0TzbJ5eqQ1sOYoTTzPzmUY/cdvg74MSUA3AJwS5Hx63zt1iIskRM4pFQOLNcDe6ZcnRJvDZpYPtxBpTMTgeEefI9wnNXcGfMZ9EMjaMQNyikmQdSunIYsXMQHf3UFz/hsH25W80/MN2LeRhWPHQ/YdwUXcE3rwhN4sEdXINx30GWtnk4e5Oj0cZthmaP1gKaSrcB/EgDhKTT6xodlN1S2F0H2oL3ivwzN4LMUFUGx2cyNG+JfR12stGZ7Bg4TNy1WJSbcPdXBtfrHD45TGwG2LNvlXffPDfCDDoGFaQ92kgeQjISqqz/JwendF9JQHCBgrpYNInbKEGWZH1FcgUkPoqd1YXuy2pSEuieZGpeXoUJ/HCdfR/jeZPr/BfoWPjvlpaQ2CRv/oiCwgDV0kWPMAP2NBpBt+C45krf2OqiTkvj7NbjJhaCPKc9XSmlvPb6/qmMPXPde+HjUkoHmwP/jsldfHbBwybEMxY4SrRGsu9EPuBoTQhaTJEUMIH/DzZzwFevwvW4YHJlpB6Hofrmr96QFIOhNNGNXpTCHayCjf5BNdyUvcXnVt0nxXywuZCBdz3sQOCGMFsljg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2ZMU2hXMmtQbGtxRTFBc05ETlorV3JMSVFmai8xMVpsZUJ0Q1dxNnU2QlA5?=
 =?utf-8?B?VFVucnkwaVpkckt1eFBSMVV6YWYrQnZhWEQ0alFmcmhoeXlMZWlHcE54OHQ2?=
 =?utf-8?B?UmdBTFRsbjE0aDY5N3ZFeXl3c2lHTklYQmovRnJLVzBaeXVtT1dCeWNmd2Vv?=
 =?utf-8?B?ejRrSmpGeFllbDlTZ3NiZUJXQkZjWlVsVGZBUGsxTTZqUklyVC8rdWFSa1dP?=
 =?utf-8?B?WHVXRklYM1N1SDV4TGVjbUQ4Z3FNODZkdUZ6RFRuTWljOTZQZFlJWU9hbmV2?=
 =?utf-8?B?MndtcHlGOHdSWjlHYzc5OGFPVEZhRVdwbXhSRHFPaVRyRUJrZzVvdUlRTFJ3?=
 =?utf-8?B?d0dWVEpobUtGbnhiWjBRQWhSMEcvcnBtcWVCYmlSMEEvUU9OcndnNCtXQkZY?=
 =?utf-8?B?QStycEZiUVBQSUpUS3hwT2tUbnoxUVp5aTZreVQ4Mmt0dzdFTWFpbUo0enNL?=
 =?utf-8?B?U3VkenRlUy9pSHMvL0FvSjVEZ1ErU3NtZGhoMUpXSDRxQ1VHaFhwNSt6RWQ0?=
 =?utf-8?B?eUd1TDZpeTY0RmN4NWQyd0oxNCt6WEdlYlR2clcvQWpsN1ZpMkVEaG1STTFt?=
 =?utf-8?B?Mm1KT1BPUXdxbnZDNGk2aHJGaC9hVzVlMXYrRi9pdFV2QXlYMU9mN2lQcm1x?=
 =?utf-8?B?bXhvcUxqd0JvYkltNnloTHQ0V080Y0E0bm5hY1dsV29HYzBLMFh1SFFRQWwv?=
 =?utf-8?B?ZEdZbzUwL2dSdXJ6ZkE0cTZFWEpWOG9yUGR6WFMxajNHQ3VqYkVjMW5xN09L?=
 =?utf-8?B?Ukx4MXcyeXc1QmNSZ0hFc1VOYlJlT2hQTUdPUmk2bXcvR05aNEJSR2NualhP?=
 =?utf-8?B?aHY5U2dCanAwOElFS3JWNmxRbFRlWWtsN1BaQmd1YWU3VEpjQ2lZZWZlcS9t?=
 =?utf-8?B?NHZ2MjdUMktvNXcrY2dNQmVnZy9UQlFYR1pYcFplQ05zUmk4YXFJdjYrTVp2?=
 =?utf-8?B?LzVNNitGb2JwdEI4eVcvNVZXVzlxZzZpZ1JsNHBUSlFPOFV2TEM3c3ArYllt?=
 =?utf-8?B?N0hSVGZwRElQNXBNTXBOMGYwZ0RqMFlmcStOR0pLWlV0RjBsOGdDbHAwMktl?=
 =?utf-8?B?UE4rNEYrdWlqUkpvV2dNRE5xTlhoclRVQjlSS3phSXZHTHA5OVozTC9rd0I2?=
 =?utf-8?B?aFBxcEdLWklQUm4yclE2aU12NDVVZmtOYUc4U3NEajVNaVZ4TlpkOXZYTERO?=
 =?utf-8?B?TkRrVDRCL2h3N0EvT251bzJubkpiaHA3S1pRU2ExQzZRbzZnTXdxN1h0bk5z?=
 =?utf-8?B?VFg1aUJBbTFmWm9pQmlFeXBqSkhZa21RZU1rSU5kVUtCa0NmNSs2SXVvZTVs?=
 =?utf-8?B?RWphTWI0TFY4V2dpeEVNUEw3ek90dDRYeHZabWUzcnNUaCtmOTlRcEo2VnlG?=
 =?utf-8?B?WDRUMlF2QU0rMGNVd21Ec05DbFcvM1kxWkxoejJGK0duTmlDNmdDTmtBU3Jv?=
 =?utf-8?B?czMrWjIvaStaZWdmSVVRekNzSWV1T0ttb3JZbmw1RW1Dd0k4RTEyRUx2U2VR?=
 =?utf-8?B?QkRQTjVvUGIrTzZxK2lvc1p3QjhwaVo4NHJHbGJxTDlpaWZuVGo3Q2tGUnpq?=
 =?utf-8?B?bUFZZ2duSWNjNXRoWGp1K1ZPcnh1WEZrWk1TZmJva291eUFtZzlUZWROVGcz?=
 =?utf-8?B?VjRhZFZsdi9aVXlncnk0UFRoaGdDRE1KdDBQb0dQMkJBS1BXdXFMZnVsVXFF?=
 =?utf-8?B?YWIvYzBhT3I1cmhmZEdvRjNmbjU5TmNpMnRaNFlxc3RGcHpQKzZxeFV5c1JI?=
 =?utf-8?B?REJYOGtDSGMrYXo1TFNHOWxtMFNtNjdrSEVZTFIwVnQ1RUovYTVMODR0M2U5?=
 =?utf-8?B?cGxnekl1aHVQaFpPYWZNai81R1FoQ2NEWWdERXZvNHFBRHlKc3o1UkpqRE0r?=
 =?utf-8?B?SmVXbloyQUowTytxN3ZQbDB5REZOK20rclRvcStEa2xTb3pQQVM2RFR5clJS?=
 =?utf-8?B?emoyYkZHSzlLRWpkaUNrRW9JSWFoazI3Y2ViRkNrbWpESkY5aTlFeHJsaFBt?=
 =?utf-8?B?bzl3ZkhqL3JJN3hNSlQvS2svKzY4c3BXdS82TGxRNktVditaZmpud2RNT0p2?=
 =?utf-8?B?UHFrUzljZGtPSWZxN3UyOHdzUU9NV3YvMTZTRDVCbm5hcGNmOEN6VHpXVmdF?=
 =?utf-8?B?VUJvNXFMYkxWbDNobG5oUGVjMHk1SHdiN0RTZGxUSmJPT3pFTHJHM2JKYSsw?=
 =?utf-8?B?dEZUaytVWUpiWWlqWWJkTXVETndzMDJwdzdFNmx6OHJsQjdaYXlSc0xUVDQ0?=
 =?utf-8?B?T0VTbE93VVJydnhKZXUyNDl4ZjJ3QmZUcmZqcEJFdFUrYVQ1dWJlQm02NHp4?=
 =?utf-8?B?OEJLbEVpTWluYnZOQTJiK29DT09OQ2lsUXpsNXhBeHVpOFNIMTgyZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f7d402b-e98e-424e-08c9-08df185215c3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 02:34:54.3466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9Q6MpIXiUPz8ltA+IQ5nuWxIdpHIGXwIba/fMsH8qOzfd+exIuYwyOOhgBmuAnClnUvxrGy41kyZoBCK7iYjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7750

On 9/18/26 3:34 PM, Timur Tabi wrote:
> On Thu, 2026-09-17 at 18:07 -0700, John Hubbard wrote:
>> GSP-RM runs on LIBOS, and each LIBOS task logs into a buffer that the
>> driver provides and names in the init argument array. The r000 firmware
>> runs LIBOS3,
> 
> Even on Turing?  I thought Turing/GA100 still use LIBOS2, which is why there are two GSP-RM
> firmware binaries.

Oh yes, that's correct, Turing and GA100 run LIBOS2. 

v4 corrects the commit message and the doc comment on the log buffers:
the r000 firmware runs LIBOS3 on GA102 and later, and LIBOS2 on Turing
and GA100, and LIBOS2 maps only the init and RM log buffers and skips
the names that it does not have.



thanks,
-- 
John Hubbard

