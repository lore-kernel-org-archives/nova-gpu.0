Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011028.outbound.protection.outlook.com [40.107.208.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9113D292B54
	for <nova-gpu@lists.linux.dev>; Fri, 12 Jun 2026 02:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781233165; cv=fail; b=KAuBVl+n2bifZDtyFnm1fAnGYwCvpfbIBsUQf1GqgIhjucTxpKeORcI7/NAKBozmFA6p1wisfoERaL93rKX+CJNOROoupo8Ky7Bl2DIAJGnOzqNVW0ZaKK81eulu8KhRIndAugOxz+u7Evbn46SBq+901cZwBJHLiOkqhpnYfTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781233165; c=relaxed/simple;
	bh=Sp+vqN+UM50XfSg3UbjRL2snPgddyylFEabLn/wY1rY=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=tyk6LWVmCyTDA6S1SiqBODRKNMSk2WqL+z3PsK+bJFXSpxzEf4K5DwrdTnQmejKwodPF1m1+AjxCk0Mlue89CqUBObeSJ5TDAxfNRDxJC7Fw2yzu+5Sz+cwUzO9K/RKlQPRbuAtz7kx9EB59RExtvwA5vzmb84i/TyPbBwKOZ4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Q6JFWTFf; arc=fail smtp.client-ip=40.107.208.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q6JFWTFf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uNrlzpj78s5zykgG3i5W0CzW8XQECLPetoNY2aSGeiLb69p0aNKUMXzvX+qGCzsj26AyqAKPo9jmjD4jMibLac3RRyEeT/OkggjmMoIUj/7+1KN8PC89Ronnl4rQa7Bo2svGpM1pIcCOhQMAq2KyIoPtW9RyAIcOdGidDCzSMJUCyH2yexfBzz6ZwitZohzqVUGrpuajYxXhbGSsGjOMP+mA5M6nAPiwuO4DzA2aNQMzboaS/2AqCCC76a/8lPAlzrt2zXW+iskNHZwLCqBSqizIEdNuw3OMw1qDDI53RGn11m59h1Fmc86cv11B7aVAA5PEILfFO/NA27KAjqoEzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sp+vqN+UM50XfSg3UbjRL2snPgddyylFEabLn/wY1rY=;
 b=k6NEmw0y2MjC/1XX1MCUPjeJb8V75sfWPnhbEbIpK5AmMiJNIh89zaic/Uca8SfiunmOpOsw/4FksemFy0L+RGjv5EzmoARgyPGCT7o4liXS+v9JAT4OzLQ25AxGhYsPm/b6e3P1rLbSm0CLRc2NiR/N/wrnHtGJjhzIXalucXvTJPcuLgHQ7lSx/aR9kQ/ShQVMa3eZEGv94YxXAas8inrbjw/B9IREhstR2CBE6WLVx2VWe1rDAKH/vV6OG4wuX+Rs2Pcv+Y2zZCfGL3ruFGFTP5yYXaQfO5CQGPkIop5EMVSDHRfK1XlXsQRcnm9z+ydKEGYRVgDrOOrA5lE4Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sp+vqN+UM50XfSg3UbjRL2snPgddyylFEabLn/wY1rY=;
 b=Q6JFWTFfvFt2A1nBBCrmU+7mrD0jNxWsY4J5F/MU4qf6Nj4bK0udJAmgTDeLtS91Cfe/WjxacSSLXS41WIewU8B+Go73FhfFwITqF88/xY5fs0Uhg+EvMkP1tW/ZDWzcB5eIckCmScJJ/VwTVOMoj2y/QNeqNnY8LB25MSWb005NjaPAi92TeUhAzTdQi0ycRsegrHVP0Y/M8Gi1JsN1tvWuS3stR/skH6ywwa0ILC6mpMI/aONQLAGygxku3xNPw3EDHuXDfe8OkqQ4/trS4++fQCJ0u/emTD4/St7bl9Uuj6/Qru33fBRPIS8AMgsS0tiQzSofw+v70M3L7hquoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB8982.namprd12.prod.outlook.com (2603:10b6:208:481::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 02:59:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 02:59:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 11:59:16 +0900
Message-Id: <DJ6QGFI7FM5J.24XDW5X9AJYZ6@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Cc: "dakr@kernel.org" <dakr@kernel.org>, "gary@garyguo.net"
 <gary@garyguo.net>, "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>
Subject: Re: [PATCH 1/8] rust: firmware: add request_into_buf()
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-2-ttabi@nvidia.com>
 <DJ60QHQPQF70.1SOTS6KEVEQ5C@nvidia.com>
 <78734fd67dde42efa7fe02b031b67686e08b37a1.camel@nvidia.com>
 <DJ6GNNLVSRQ6.KEY8HC7A6T67@kernel.org>
 <2999ddd661da04f41d31b96cba3e8a666dc9d2ed.camel@nvidia.com>
In-Reply-To: <2999ddd661da04f41d31b96cba3e8a666dc9d2ed.camel@nvidia.com>
X-ClientProxiedBy: TY4P301CA0026.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::6) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB8982:EE_
X-MS-Office365-Filtering-Correlation-Id: 95229b01-abd8-4648-43bb-08dec82e9975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|23010399003|11063799006|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	OhvrXuot9TWkRLsljf3u9pUwg3hOFAkFALjhpjRmjMH7EAy5DFZ/D4r7Mkszimz8aJ3+wRgAAAnF6zXAwdJaU53dFgXXvCtF824r4qmvr5aoVs2X+snSRlVcqnVllA7GMr5fl8uXPxewCw5kQ8AWYTbWClnhAF2jQrq2wJWRUC04FtFZwvWz6x32qhEfz/CfiIhLL2UOU18fAe0Gb58nkEIB6pSwnSYodSRH8lHLEZDzh2saABUA59/9M9ayZsO9R1ihZ82oDEbpnAGXl0UmPLbQ9LV+JX4L/Eia3qU6M2YQ963BLOFtxn1AyzWnhBzzNFMfhHILV7+pnF7UCEo4s9wp81nVGwyusiuBTNzqmWjStgXHDBVRGsZOFAL1ef8xZtb5Uws4InNhw/Ty+g9HFKxk+2ejz1ZczwAWBv4NuSVF30KWGx9X2md/eqK4A743o57CkUj8LNVX+Abu2yQtGKqgu3xljidxgr8r+e9vJaQxcJfdln++wJG9BvI6FwxOCSqeDiYGUxVFSJ3jIYm9zZAQxDhpC5v5Dl4ghwxvnWll3GJO3JJ3Lb2/Qo3r/xoYPJ/YDVHeu9PfAPe7wDXqg/jdSCWYbH6oYbj5k3BBXMFF8GhYY/JneVSfjerKZUThmW2FxVXCsKaOYjvN63sipE45yqnsJ3tbtqH7P9uncNEJWjvpLvTGatz9jYOxFkk5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(23010399003)(11063799006)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFZnRHdaWmg5WkQxaWV1Wi9RNlJ1MHpzaFNBQlB1Z2VVVFRBT3dGQUxUdnZm?=
 =?utf-8?B?ZE44a1JFamZGM2F5SWpzQTRWYXRuL3ZOMkRlWG1FMWhHK256bVkvS1lobkV0?=
 =?utf-8?B?UllVZjVqR04xTDFNalZmZ3FIc1NtcEdXYXlHT3I2R0pDYy9wN1lkR1lQT3FR?=
 =?utf-8?B?Vys2OXN5NUR4M2dyZUM0ZzJxc3FNclR0b1ZYUitDZUMvMUZkTnpWaitoVGgv?=
 =?utf-8?B?c3d1Q052QVhVeGZMQ0tQNXZmTk9IamNtNkswUFV2d0RGN0lnYmVnTERjdG5v?=
 =?utf-8?B?WXlDZ2crM1kyL3ZtZDlneVA0QVJWQ0lpbzhMOXlXbmZqSDhLNVVBeHdCNU1K?=
 =?utf-8?B?aTdnZXpzS0RGRlgxZy9TV2xrRjBtWnRkM0w3VkMrek1vL0s1UlllRzFVazYx?=
 =?utf-8?B?K29nMFdNeHdnaXlDVDRxRG93OGxYdTIxYjY4eE1nRnVKdkt6M0w0YkcwQU9x?=
 =?utf-8?B?S0I3QjRUelRSWXhZZUFYbENKbEVqUmExVGp6bXMxL1NJZ0c1M2MxNHZ1Wkx4?=
 =?utf-8?B?ZDQ4MVpxQkFZNU16M2JtVk9Gdk9zU3MzU1VsajFibEs4N2pib1FrNERPalRa?=
 =?utf-8?B?K2c5ZkJYS3BGN0lrell1UzNmQUdFOVFaQTNSdlU0TEppLzJ3T0NMK0hSamp6?=
 =?utf-8?B?azVNVlN2cUZIa3ZHODN3WmhYSVdBc1JvMi9EaWg2Ym5IZXVoWFl2Mk42Z0NN?=
 =?utf-8?B?SFBxM0IzVllQZ29FcXUxT0ZyOVpZMG9FRHJadXZ3Qk1IbElwSVdQekFha2da?=
 =?utf-8?B?dHBkMjI4WmtWRW1Id3k0ODlCN0xoR3lydUpGR2Vhc09PTzhJOWJzRWpIWEZG?=
 =?utf-8?B?ckVvdmxmaVdBM2V4NDFQTFlPeFY0NTdJbVRqWWlzWHZFOW10TVNld1lHSXMr?=
 =?utf-8?B?aHJoODBHS2hFcS94dDhPeXUwQmtuUlVSN3Y2MVRWMlNmT3oyZmI4T0JlMFJ5?=
 =?utf-8?B?REIyZnFqSTRBbFlRUitoZEtBNkVla0d6K2dCWnN3U2l1Rnd2ZUhKbUpnMUJZ?=
 =?utf-8?B?M0JjRVdMUzQrR1J4R2JweEhzM1ZXSXJrTHBVTDJrbDZsNkZ6NmxOVzl4bVFm?=
 =?utf-8?B?UG4rcUc2VUlYdHVNR3JwKytlM2xIcDdHWllLNE5zek9WckprYy8xRmZhZGVV?=
 =?utf-8?B?dGxJYUtpRmJaanNhb29oWXZCVytJQi9oL3VHTzZQdjEwVFZ4cUhIYXRHbTFX?=
 =?utf-8?B?ZGFOYXNEaElkY09NazdBUUR4MEl2R1ZSUXlpbzcwWlFESmw0NHMzRURqSVNo?=
 =?utf-8?B?c2paWXRUNTc5RTJpWVBhMStFYzZScTNnSExtU0J0RUQ2WmZ0RzJsR0x6QzlB?=
 =?utf-8?B?TUxOeXNVQ3B4VDBaTUk2RE9QUG9XanFRTFhWZUthQ3hWaCt6NHkvMmwwRmRV?=
 =?utf-8?B?a2NWSU81bldJN05WVkl3SW9xNXVkU2J5S3IxWWZQdmFYaWlrYTBPcm1SK0dW?=
 =?utf-8?B?QmNjMTBoU0VUbzJ4bWYvdFBzM0w4cW1DSkpIK202bW9ZNWVwejVjVENuLzJ0?=
 =?utf-8?B?aUFSaTgzeVhvcStIK3JCYm9nc0RoNmdwUTZFak1UbGxjZUU1WmJxYy9qWXpO?=
 =?utf-8?B?MVpHNURRSFZJakRONkVoMGFXWUpWb2Z3dFgrd1IzZXA4NjU1eVU4WlhReUxP?=
 =?utf-8?B?TVNaK1liU0ZYeEE0OVFqUE9NbFVDaUlOb3ptczFlcldNRVE2bHlqT3Q2VWIy?=
 =?utf-8?B?eGRacms2SFRzd1huRnN2a2habldGZUZmVHE0RHN4RFpkc3VpZ3NEYVZBMTVM?=
 =?utf-8?B?MnAyTGFMc0ZUT3JNVm5rRFQwbVpIZlNjWHExalZyMkdTY091T3ROZTdOOHRr?=
 =?utf-8?B?eXQzVlJORGM1QWlVUXNWZjVnV1BNZGd3VkQrMXJXQjhVaTMveVZKaXNUcFBn?=
 =?utf-8?B?TkROaDRWQjRZeEgweVJqSWZyVXRxblNLUGVtMCs3cVFRRG1IaW9OOURLT3Ns?=
 =?utf-8?B?dWFXbWJoaWtLSTRMVjJnVDFzSTVmZ0JEY05uRDhLblpxRXI1a0h3RDlORDBr?=
 =?utf-8?B?ZDlLTjA0R0t3THd4c0plM2RZeWVmOS9sVU1zOU01SGFjS1N1MHdoZDRoblJk?=
 =?utf-8?B?TkM5bkpzNWd0akV2QzMram5XTFN5UGsxVWJ0d3V5VXBtOW9XZVh2N0d0SG5P?=
 =?utf-8?B?cjZod3E3NGJRVUp5ZWw2bUZlS3RUWXNud3JIVmJUR0ExRGJQaXdQSjM1b0tz?=
 =?utf-8?B?eEtiZ2EyUEZiSytVaGdRYXJSSFhaZHF1aUxodllSaWxhWkl0cU1KTTMxUWsx?=
 =?utf-8?B?ZFl0a0pSVmo4QWVqckVVTHppUHJBRmZTTElndDVoeDZ5c21KQ1pzZS83Sk9Y?=
 =?utf-8?B?V2F5OWZkNXpOUXkrazNYU3k0NFJkSjc0Y0czWHVmd0lzSGYzdlA1YXZ4YTNr?=
 =?utf-8?Q?FLBdFaEeqBfhvVqNraZ/q+JJwHWL7tPAUZ/HnEKlWJ139?=
X-MS-Exchange-AntiSpam-MessageData-1: wuxajjlt6cH13g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95229b01-abd8-4648-43bb-08dec82e9975
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 02:59:20.9114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xNXgEWPKCcmSWHewfVJpOt6EkphldMzp+GttHZRPIW9WROnL2nCA/TabDQQDERpeZd2AD+aM51p97dF9xlb8WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8982

On Fri Jun 12, 2026 at 4:28 AM JST, Timur Tabi wrote:
> On Thu, 2026-06-11 at 21:18 +0200, Danilo Krummrich wrote:
>> > Sure it can.=C2=A0 It allocated the buffer, and passed a slice of the =
whole buffer or just a
>> > portion.
>> > After the function returns, the caller can do whatever it wants with t=
he buffer, since it
>> > owns
>> > it outright.
>>=20
>> True, but there is no reason for the caller to create the sub-slice on i=
ts own
>> anymore, i.e. the correct usage becomes the "path of least resistance".
>
> Is having the caller create the subslice on its own such a big deal?

It is a potential footgun that we can remove through API design.

For the way we use it in Nova, it is not as useful since we work with
the backing `VVec` to DMA-map the pages, and that `VVec` won't be
automatically resized.

But general users are likely to keep working with the slice if they e.g.
load the firmware using regular I/O. With a returned slice they cannot
forget to check the size.
