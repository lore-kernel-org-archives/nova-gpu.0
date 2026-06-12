Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010052.outbound.protection.outlook.com [52.101.85.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBB033F5BF
	for <nova-gpu@lists.linux.dev>; Fri, 12 Jun 2026 23:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781307608; cv=fail; b=C9AP00lTYqNTz344AgnbKSpqoSyIhlTqfQmIKS2hfjsDPchD66CT6fKA0Iix6Lke+ehqr4G9imRMltjc8NETX8csOaSE4MxIBXgwe3xZNRahjd3/lOBLbwuFLPnx/xkjyZC+vyK2397fU5r6M03v3Ae2k5f9hgF7wSgaWGGb0bM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781307608; c=relaxed/simple;
	bh=AnqT3eSgctYMk/NFSX76MFoNLn09qCMtg2idFNABn2c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EuSfXof2X3cJ9AKpCP3s71shOwww2Pl59oUbxnQuEaf2UlOTJMMfFYJcNqO5ZAzdOhDWxvYSr+zBGkibTIRItbJ4pfGr2th+LC4ocMKc2xyEYwdC/kVViETvZybN+xQxTCE1E3lkqzCB+U3D5348XBjmdCTxxl+/I+XPWSZjd6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y7QhvDwA; arc=fail smtp.client-ip=52.101.85.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y7QhvDwA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7JXq430vC9IKnVtCWoxuLctM9wFVBG1Ku90VEVAgpMpTIvzNNIOXOSsGUIXXuUBtG6SwxuYnnpnI6/Ri9sLzvyzyAyqSTVJvgDGkWzWPnuXPKXrJmoe1msuNVnd1dlDSZ9jjYWVfWxadf/9/YXFHMpwogzyUdfXW6hAlRl4Y+0SstkDn603NDg6M3i7R/4Y2mYFJ1ftUebW0ebqUTDwnQEbdclanHmVBSmJUwVBgqWvf1vuJi0huWGng354wrcOhR0kud2b+/Dw7c1oQs7IChZ3ME6gEXIXZeVzBLEB81jn3uXaxjPhAjOh8sg590Y5nH+uCfXB7lvA5rcY1//qxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3F4j27EctAV0qKX7+eOIKFZFxvlQkGJAhgpHDlXYFo=;
 b=i0dcUDWa6oXN3dz6j8FaLNYRky6KSQ+/WWz6dh1E0Qcw6RDohq43R3lGS4F2L/XRaS8mNpla6iP0tOw+LimSqz9baw6t9IrjVr0WSvwl0Nbb/2o6AfV11F8W6KbJN3Js49Etb87UKmfexHQzOp3+DsePOCSbhsJZkvAEZBPw9xAk7b0NIEVltT/4D5BsIrQ5rFhGBehTON1UTXBu8Z421nNM9fZb3gOkgHFp58skIu1/DTM4ga9SBoQ9QZHHzUJSkHaRwhoV8Gn0XD2Yf/UNwNXpD5dBiqEHHGuz/ADnlSRtQAijk9SKsDytxKw4oU5QGh5WXMOtpjaylIqtIhubCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3F4j27EctAV0qKX7+eOIKFZFxvlQkGJAhgpHDlXYFo=;
 b=Y7QhvDwAbAFPoozuRH2E5TD7UASseNFLH23r770LKpS84gOoup6vUjTvSvzWROZbkrk9ECv6tAUxY07OtAGmc0MMK6G0Ij/baEddUr7nOe+TVEjUnPXwYxLZak/fi4SKLJ24gqtW4ZphFqxneuldfJdd3/P0lUzKs9rIay7xQpX/Qb1GZmREoqyHXgwctEQl6QA/ADypiIrmuS2a9JkUSJpfCFNhws+7el92JaS5yhDkBVFbM/J8ejktVUpmQP9yeuvO1lz2Tm1Mylq1w0T3vou8SP17V+Yxw9CqP8q9AUS+rfsbb5pnxm8dgKIeQpfKY5DV1HsenyNiSbq20aR3YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB9256.namprd12.prod.outlook.com (2603:10b6:510:2fe::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 23:40:03 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 23:40:03 +0000
Message-ID: <c68eedf6-9fb3-4b13-a76d-df63ad6a888e@nvidia.com>
Date: Fri, 12 Jun 2026 16:39:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] gpu: nova-core: add TLV parser for firmware files
To: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
 nova-gpu@lists.linux.dev, Eliot Courtney <ecourtney@nvidia.com>,
 zhiw@nvidia.com
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-4-ttabi@nvidia.com>
 <DJ75HKIOTSNB.2TVN5UO6XIVW9@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DJ75HKIOTSNB.2TVN5UO6XIVW9@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0111.namprd05.prod.outlook.com
 (2603:10b6:a03:334::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a864ce-17db-41a2-a06a-08dec8dbecf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9zMQnLUlnWjPVe5Bt6WpKhoe3VZX4PKcRuYOO2Va1aKTXGiagAWF5x3z3y0Dffk+W0Rf99m1e4bvScnEua5GBrl6jZ47uuqrKVq/YiIDKwreSYG7kOdoP4jQxZmcTZZxgWi4WQE8Eo1zysNhzlLIwlqfK8gojCj0oQcytMTtwyt7yQWYOs2osEQVqMJ1cYqtkbL/XUCN9eIUdS0rSUGhLLgw8lNuTy028SzP6zk9uakqtAnNJ91Li4kBY0kbNFtEb7OQwfv72YMLVw6wqoV7hl58BSO4x68O7RpX4sXwcNG1s1+6KGl4nPFMwCXav2sTs5wRlvlNtBI0Odn7q2WGaQ8duQHyBbApDXJVYNpVIOprrzKowpj7rQTEmrpI0E8FI9ar9Gs9DA86Ow4YzWedtRryLzUhNariWi0z+y6c0MmF+a/8rs5SPxfDgFD1J5o5vQiTu6EaW6WluXZYiRRY3Dq0sHsA297r70CKDi+8nl1ctdC9HXBtrGlkfHUPNws3PfpbVw4WFUMfIz77pgWZqnYtxSE+I40O3lzvGMubiIyrNAdyRRMXQS+1KKvHhmV/Rfi3Wyjw2BD0ZZudnP5U4fOBOjxD0VtIeymeqc1J4EEr6RDCw3uptt8pwjIR7GWxYwMC9UmGxkg2cArvPcYwdBzkvPKgOtt6zZeZIc57hdlKyq0ORZosvYQLzEkneuQJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUVqMmF1WStpOSt3bEtaY0ZlTW9mYjFCd0V3Tjh6TDgycE40QjRKNTlxeVUy?=
 =?utf-8?B?ZXl1eHB4V0VmQ2tueCt5OWx2aEppWjFIODZDR2hJQmloaGErSFlyYXJaTDBT?=
 =?utf-8?B?NW92amttSlhPclg0VE5FVWJ5bU96MTB5ZE5iWnFScmdsckU2RDBtS2Erc1B0?=
 =?utf-8?B?b1hyOHpGVHk4U3R6clZTdnoyQ1k1d0YyU3V0c3BPM053bERIbEd5b1RmbW9I?=
 =?utf-8?B?MTFkQzlIanMyeUNrOGF3cEdHUHpRa2tseFBjVXpZZjc5c0FmMXdneHhLYVZJ?=
 =?utf-8?B?YUd0SHZBRWpwMFdlN0NkaE5jQzVvZkZTVkxhUjkrS2hleUZlUjdqQm5mNWpN?=
 =?utf-8?B?R1FhL3o1SDd4ZzdzYkVKUXRkY0VvOG5NUUNKcmpHcEg3eGY3WENUNUpCR2RF?=
 =?utf-8?B?WWxNZjM3U1VhUVhNbklmNXJGMllhbkZRSTdjZy95dG5nNXhTcnRDMEdpY01z?=
 =?utf-8?B?YS9zVm5mOVJ6Rll6ZGlZWDYxRjdNemFlbTNiZWJqMzZVbTBvcFFvSmorajRX?=
 =?utf-8?B?WGE5VDlxSFkreFFNODVwTEpMZ1MyS1ZpLy9nVUErcGNhY2hNeG5ZS0hSMXZX?=
 =?utf-8?B?NTl6MXhVckdzYjMzdE82cUpaYVpzcEM2VWp5NDVIYXJueHNjek9wUktFeXpS?=
 =?utf-8?B?QlBveTF5RmxGWWpSTmV6ZVlER1FDdU1yNEwxYXhITTdNZEZDZDJFZ1dHc25h?=
 =?utf-8?B?ekdva0RJZE9YWk9BcjVzZDhOZXl3N3pJTC9YdDFFL2xXZndSQVExSU1hVEx1?=
 =?utf-8?B?NDNKa0E0NkU5S0hMZ3pxMkNJc0M4NTZIbmNwMVc3RXlUQnkyZHhrNXNuOURW?=
 =?utf-8?B?V3VUcko3YUs2NFR6OGNLb0pXMnB5RzFkaU1uL0ZuUnhvdVUzWVhSQzEvQ1cv?=
 =?utf-8?B?VXoyeStsZHM2M1pwTktFOUlCK0hZK3AwbzNLbXgxeHB2aURkZ0hYNCtlTVRJ?=
 =?utf-8?B?eXg2VU5GdnNOY0pWb25oY3lFb3ZnUmZrZnJuRUhsTUFybFF0L1lPajRXY3Nx?=
 =?utf-8?B?a0hHWElOVGhTTzZnNlBQeXFHM2FXbUFZUmovQ2lRdUY5UDQ0anVBa05PaUg0?=
 =?utf-8?B?WTZRNkgxL3pFMDBycFIxcG9TMzJwc1B1QnYzYlJQbUtJR3o4Ulh6aURSVm85?=
 =?utf-8?B?ZWlPM0dsNTBQRm9raC85MVVTTENwU0IveDBwWThjZG05UjNGcGhIOXdFU3Zo?=
 =?utf-8?B?SS9FSEsvRzNJV3dsWmg0TnR1VDdWM2xNb3NZQ1R2Y09NbXVLTU9rcGNkcU1R?=
 =?utf-8?B?TXZiN2FXQWFpdU1QU2s5RnlzbEgyNHNZQnFqYWJmamc2MnlkRU1NL3hHbXBO?=
 =?utf-8?B?Z1Y5VFEyYWJyTmxlV2ZJaDl5TU05SXI2Zmd2ajJuVFljVkVwTW91bWMvSUZi?=
 =?utf-8?B?SElJaUM2U3h1K21uTEJubko4RnEwQ29lYUY1K2JNbDlTVi9ld05mbVBjSHJL?=
 =?utf-8?B?NVFhcVhGb1JsN1pOckFOSms0R1pPRGdvWlBIS294L2tnTU4wa2dYbEpWaG9U?=
 =?utf-8?B?SkJPbU91cnFhK3B2OUdPR0Rmd3FqZ05UUEVJbDdlbFZqYW1SeWpUOExNZGc2?=
 =?utf-8?B?OXRHS1hhKzJMSjJPM2lHKzJFVW1SaTJtZENCV1hKWVRQSU1CU3NEZlJTZVFL?=
 =?utf-8?B?N0lmRklOMXl4MG1hQi96OWsvaWxraWZVMWtjaHNwNHFadnNIdHJMemMyNktj?=
 =?utf-8?B?OFZTRFh1bXE1ZUtLZ2ladDRMSzlGVmNtRG8wcTlWVG0rSk5CMnU1K3BKYkNl?=
 =?utf-8?B?STUwaU5Tazk1aDI4Tm5zaGMxNy9qV1BxK0lNQUsxMmFYalc0WjhEb0ZGMVMy?=
 =?utf-8?B?RmlxV0ZtbXcxYXlsdXFISXFjcWtTY3RSWGNBb3VZWXE0QitWSjZHc2IwVDl1?=
 =?utf-8?B?eHZmRFVXMS82eHdtcGcxWlBJY1phNlpmN3g2c0lBNTFQdEpWKzBPVlFmMVYr?=
 =?utf-8?B?Z050aUM3eGdzWVhTT25qdW5TdkU4MUlxTk1sbnNNZ1pPOHBWc25GeVdidVRB?=
 =?utf-8?B?VVFocUd0V0NTNCtudlMrOThzOWpZRytRU05tWHk5dktLTDRXU3Jsei94Z1Z6?=
 =?utf-8?B?c3JBbUpiK3BDNUxjQjZWbUEzNCs4RGZGdFVleGE4dmZpNCtMemVsbnJYdi9x?=
 =?utf-8?B?MGM2OHVRalpubXhJRXJ0Y1pMa1lhZzhGWUJTbTV5Mld6bzVLdWMwcDBRWVo1?=
 =?utf-8?B?cEZUc3VWNXBuOFNKb3locU1NcURIc2NOQ1p5bnc0NktkejEzSWZoSjN0YVRC?=
 =?utf-8?B?dHhnTDd2bTlRbzE4c3JVT0U4cCtYZlVPV1pFRFYyYnd4YnJDQUc3ZitvWWMv?=
 =?utf-8?B?YmxMTlk0L1pKTFp3Q242dTEvM0ZJMlFQSnd5aGVreW5TUEVqc2trQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a864ce-17db-41a2-a06a-08dec8dbecf3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 23:40:03.3689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7FIo9UFdImbfobHENH1vXbJOCrwHCprXaM8po1rXVVaIIzSuNCNcHbw4YNNpbXYV5+HgCFv+D0WL5HwWOrDQnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9256

On 6/12/26 7:46 AM, Alexandre Courbot wrote:
> On Thu Jun 11, 2026 at 2:49 AM JST, Timur Tabi wrote:
...
> The spec says that strings are expected to be ASCII without a NULL
> terminator - and the NULL terminator does not carry any meaning in Rust.
> So I don't think we should be doing that check.
> 
>> +
>> +        // But do require it to be all ASCII.
>> +        if !bytes.is_ascii() {
>> +            return Err(EINVAL);
>> +        }
> 
> Btw, is it bad if we allow strings to be UTF-8?

Yes, it is bad. :) This is a tightly constrained file format,
rather than a general purpose filesystem. As such, sharply
constraining it makes the code simpler and easier to confirm
correct, whether via reading the code on the screen, or
setting up test coverage.

thanks,
-- 
John Hubbard

