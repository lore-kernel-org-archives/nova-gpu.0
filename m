Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794356437;
	b=pOR20QS/4fCwMjFeqkDT64TQN0odU5w+BrC2jwC5QTQonjK4OZZkUEm/jQlRQiNzLxf3
	 UZrQj1sYhwax6Bnmtyr8/1KBVbWIiiPzqS9c5B6dCRf08glcfSTni55kFsg4AgLMpyRjX
	 iPjqngT4BEVwVz8vAKbaSlt03b91WeLhJEwKqoq+o/DzyoUuvDUwezUJA9srdh4NHQx98
	 TUIkoyXrp/im5AUJ/gwrjfactnLJEl2iWO1XbTskPfOUCFE0IbaXdrZqIQvzUMYC5xypI
	 ncasIZA2tyjPLRQBomiNKuV8GyDBixfXCDHpPB7/dzaLM4bS5E2M8I1l0H8MmdKWShQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356437;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=gEbpmpLfwvuqGrWiA1xAcSYpcMjoPGk0Kp2UYmN07Jw=;
	b=QD6LfHf+81EsC7Ap5vpyaN0u5i76RSKisnqJYmKazTdYlOdBsNgWJQkBTk+pL/UwW8Ok
	 NLIZgxRk4u8424zdx2t6TicwUxt4klr4v/HvlkJJEZqNTe0Xy28pOJxlJfcli7ARhZ8K6
	 rvmos80rq+iDvRei3F5us5Niq1E8E6PPqCnZhaViYWG837QJWdT4WUlqF4lhN8hek5xby
	 kxn28lEnpZaKM6l/L5ned0d/s6V5clxHrl1QC6EmZz4egX3ACq3njvMfWQ/VO1efDqH3Q
	 NWYnR64RW8SjkvONtHu5O9SF0kPjy5EK0ls2Csj/kNBVFpoGf8H1GHDY+BtZZcuEZhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Pw0fXwmB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.20
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012020.outbound.protection.outlook.com [52.101.53.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E253606A331
	for <nova-gpu@lists.linux.dev>; Wed, 11 Nov 2026 00:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E253606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Pw0fXwmB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPXHII7gYGDG2vGlbKhzPh3vIwGfMDu5HylEmsthO2sWp7gzy12e5AvIcWkATrE2vZ3vD1hnH9ygqOaOwHAoSkZqH4r5eFGpoDm7jce2N9wSK9VyfTGHxUoNQBzlSQzzgeOwuLq8kUE4PBMWDwFPlyxBU+KEd3dwjqa+goKhBnU0XpzXViT+Hh88dNY+dNTeaOWWy/3K9faRozFDjZPEDQWRZGUfY/0eJOlij8ycM9hcmseGH3Qot59GFzeed2t8XgZnJP9PpROiXg2YnOes8v938TZzHUBiQtijE1IiUshfYUHMNS8zdVwZyJ65bCjxLnmjEEM+9CfWonQTzhFkEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEbpmpLfwvuqGrWiA1xAcSYpcMjoPGk0Kp2UYmN07Jw=;
 b=Ya3eOUdTwdg+ATEo6E/tWXNZ9QVv/cOAV6gnkVM56CriWiBJhMUiEccc21RCLEusOlQwyLagF8JLleNqF3+YPm6EaFyLGt+88tVZVoXoFw6fTRubbujV/GVl7g9D49zuYbegiUM1SRVCG5B82c1KLWPqgJTzdWBnVzqO+wlQGtCdygPndl8t5QiGliUwUxxNT1jLJm7FzgE30kCEgJCT/oT7roufcJTGyhR31qHaHG33+zEu+n/w7RAesDzceURtudpsjiCjnAHLgC+MYkyxiExfcZ6a3adu6lX4Amxu3xRpryZwbkDpZ6IYDXkGr5aRS+we6cOxALocYWe7Bi6hQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEbpmpLfwvuqGrWiA1xAcSYpcMjoPGk0Kp2UYmN07Jw=;
 b=Pw0fXwmB8pX0Js5C2TT9VaH5pudfadsErABquAWFpYodQNzWccBd3A6UtzZmFwyhIpaKrXANdhSltvj+wJ+4DKc1pdTfprFxchFwjcslMva/QWBZBUvnnXOMcuda6+ZVVReIPGXptBK7OmtID27wGKpRoyEpR0JLZ4J/rd6QSjG5X4Sl4Z3GYdXCy6fgIX9xzPcgOkbQqsz4zy127v0DkrrhvhgYOzdDQHXJoDzp0GRWcL2n4j+LV5Fc8oUqJ6887WOVw2nq2CH7LMNXfotQfmmWKnmCzKxv9+YDT7iWgyAGJtLi5mgJdCyriIB9huJVUcHEAW4c8HIOfmbSDepgtg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB5614.namprd12.prod.outlook.com (2603:10b6:806:228::7)
 by DSWPR12MB999130.namprd12.prod.outlook.com (2603:10b6:8:36d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 00:20:32 +0000
Received: from SA1PR12MB5614.namprd12.prod.outlook.com
 ([fe80::1a0c:e9e8:f3a5:d9d6]) by SA1PR12MB5614.namprd12.prod.outlook.com
 ([fe80::1a0c:e9e8:f3a5:d9d6%6]) with mapi id 15.21.0592.010; Wed, 11 Nov 2026
 00:20:32 +0000
Message-ID: <199d4ffe-780d-416d-9946-f21ef18678eb@nvidia.com>
Date: Tue, 10 Nov 2026 16:20:31 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] gpu: nova-core: add Tlv.get_u64
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, nova-gpu@lists.linux.dev
References: <20261110231053.1352163-1-ttabi@nvidia.com>
 <20261110231053.1352163-2-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20261110231053.1352163-2-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0170.namprd05.prod.outlook.com
 (2603:10b6:a03:339::25) To SA1PR12MB5614.namprd12.prod.outlook.com
 (2603:10b6:806:228::7)
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
X-MS-TrafficTypeDiagnostic: SA1PR12MB5614:EE_|DSWPR12MB999130:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e6245f6-18ba-4dfa-b00d-08df3f89991f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|261009223027099003|10067099003|261028144727099003|261026140227099003|261022105027099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Vk8PU/QrZxPpMAaSaczdjsvJNjEBPdBgJqkq0vgqkTOQiXrVq4lCBLgS+fiN3Wbu1dF1tXf3uHrvD/h/t1BPzZGE7Wu3QYWrf6x1+aeeKeNXJLRof5fDjf7vxUyWv9U30mgVrh1sA6A84s3PWekIxosZ0F38VdJvvwQk4r6le8JeZsXArfMCwlEp8ZIMuHE7TsIX/YLEmLMx1oX2zeKyNs5diBGcKEdggxBMQx4U4CF0eKPYNg1UWB8h4vcEvm102fXXfi6M0b35aLnyBs7/FK6xA1wXGX+nik30MRAe/63qIXW+++v/XwnEVaEJ6GQFGJkDBB92Lck5mk+vOsBR25MAJ5HiW8AuAehSsQDXQmf7zsWa3xSJwSyiuOP9XAHJxhx+84asWCiXbvKPh/ADvQ2wRmgoWXo+aKdsZsajSx8tehnidSTueCcwWqP2M9SO3Mx0T/AlY9Hp/gIVqfiQFbiwpQ+Onnz3mOKXCiUDDMJismXiSdQjvmukd7uO/M5CzB2rPnkQwP8KknJ5DCKBxx6S4TwRFA5mjoxVlDD2g033IE9C0D64iUZJg/rstf72AKItzjcF+XfdnA2pyae4dU+GE8bD4k/OP+WtjVYARjk5EeZ0NGJiAH9za83JU1Euqy30E+jjnkAMkwsLBFQ+qsu7/mzRswPmEVS75HXTwf8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB5614.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(261009223027099003)(10067099003)(261028144727099003)(261026140227099003)(261022105027099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFBRUjF2Mmo3bmF5eWpnYUovWlh6Mi8wOXVGeW1nRnA3ZSt3SE9UMlZYY3Fx?=
 =?utf-8?B?RHBnS2F6MXRIVkw5V2pOck5Tbk1kSFFjSnk5Zkt6amt1MDl1bDlxOXBhT3du?=
 =?utf-8?B?WjVUQVJDQWVnVVNLNTV3Wnh6T0Z2bXBER0pwVFduaitFb3NXVHdLOTJrczVv?=
 =?utf-8?B?M1J0Uit1cm5wd1B0T09RaEY5NG1VcEtRcUdpVXFpRWtmQndjdTJ0RFZzeWxU?=
 =?utf-8?B?Z2VOQjMzbXgrRWpaU3dCbUhMY3RxNjR3SDJXYTdzb3U0bjljRklMTndwbU5W?=
 =?utf-8?B?Z2svdXNDYnpHT1YvN1VYN0VQK1BDblVFZzBaNTRRZlQ1OHdOelRUQUJhODRv?=
 =?utf-8?B?ei96N2hiTXByMzk0RHNhdWl0SlN6eVREZ0Z4dFNDOFU5V0ZlODBGWEdNRXV2?=
 =?utf-8?B?V1FHZkVhWHZTTXdndjBleFNENHR4S3Q1d2N1UkEzUlNZcHA1ZG9SazlUNjd3?=
 =?utf-8?B?dmNKU0tJOHJTNkNlcU9FbFF2R2R4SURLdk9KU21Xa2lKZnpSKytQbE1uR2ZU?=
 =?utf-8?B?MlhTOFdQZjk4eEsyNS84YVl4czR1TysyR1g4T2FYdG0xT1VyZmhoVUlkdU92?=
 =?utf-8?B?YzF0Vk5BbFA4OFNyVEYwNUg2Tkovamk2MzNKZjFGYnI1ZnZWQlVIaXFWZ2xU?=
 =?utf-8?B?MS9KanN6SEpYQjNxbjZpcTRpNit3T0tRVkpNb1ZQOExvZ0F0WUJzWU1lYm8x?=
 =?utf-8?B?UXlINllzbjJLT0JyUFhrd0kwYnVMVHM4SnNGY2Q3eDN4R0NvdERuUTg0V0pN?=
 =?utf-8?B?RXZrYmxmZnZnOFZYYTgwQ3lkM1lKODBaelo3RDdLTTJuWTZGSzlFNHd1NDlD?=
 =?utf-8?B?alFrQjZQN1lYUDFiVXRXU0RjckU2bVRGZzIwYytJYnVudUwyTVNNM2J0Y3Y0?=
 =?utf-8?B?OHdHNEFBSTIwNis3VGZaa0NSaFVBUVJjUUloNnJHdmUwQ3Bab2RkZTVpZzdN?=
 =?utf-8?B?RldhYVpyK0R5MGRuNjM0Uk42MGpFdGV2UXMyWXR6a0UySlltNVdZR2RKWGd0?=
 =?utf-8?B?Q0tQZGlIMS8zQlBPWWx3c2J5ZERJM2tvd3JXNitVeCtIb0RnTlpUWDVnS1Av?=
 =?utf-8?B?TDRTQThsOXl0bHZSTjhxTDRPRER4cFNvT0xpYU1uZ016dG1Ga2ZBVkI1Yzc4?=
 =?utf-8?B?aW0yRjFRR2x5dHRJc05Pejd3bGRaaHVOMVJYQUJQOU0yTmdPR2RzdmRHV01J?=
 =?utf-8?B?ZU42c2Z0WituUWxNTFcxckRvZys0R0IyemtGSVVZeWxnTHRRMlNKNUpUK0JX?=
 =?utf-8?B?L2tWU0cxK1ltVW05RWpmZWhMK2FGNUpqWU9kSzJXMGxkZXl0NnJmZ1Rhdmxx?=
 =?utf-8?B?SnZmR0o0TUtOVXNEWXJOUmlXUlh0Y0ZUVXZxUWk5dnlHZzE4UUQwK0JFUkRW?=
 =?utf-8?B?WVF6Z1dBOTRBUmRLUC80SlFLQzhqb3ZWTUQzZEY4eGp4emplNWJkRlZtT1JM?=
 =?utf-8?B?ZDIyV2NJRitZcUY2Zy93Y0JleUFxU0dFWDBSMFR5V1ljeENubS9LaUlyNGly?=
 =?utf-8?B?V25JNDdUSmJmY21uaGJjbXUrVTEvUHRtR1NVcmVxUWV3L2J1MGJ2Q05mTzdy?=
 =?utf-8?B?WEtoVmNZUHBnVDJEc2pER3gwV05kQ0xFWStJVVNzNndzOGo1ampWbVZSZGwy?=
 =?utf-8?B?NUFFdWtZbjlUSVBaRk16ZHVhcUFJOS91NXByYmdZOS9JZlRtMVhsWjAxWGpM?=
 =?utf-8?B?Y3FyNHJPU1hGcE93eWJZbFN3R0tHQzlnM2FPK3FyU00zQ1Y3NnBoR0t2anF2?=
 =?utf-8?B?dEJacHFPSXJ3SmFodkEyNjMweGxFZzVwaFNqT1l5THV2cGxhdTFpQUhNUytw?=
 =?utf-8?B?U1Z6UExIRGhyMHR1cGJ1b0YxSGgxSUhSYUxmd24ycVFmZFJuRWoyb0VmMkpj?=
 =?utf-8?B?djNGd2Q5OWNHMkdPWTFUNy9oZzh3WmorUkROdWYyejI0NENsK2Q4VW9aa0tw?=
 =?utf-8?B?YTN3WEphTzdDSzRYY2MvN21KTEFGUkozSjdhUENMN1BvQXN0blVRSTFDNUZC?=
 =?utf-8?B?NFhFNWZYVVJ2akxHbzJtN044OExmbG5zNWRwZTFNZ3hzMC91N29kUjJjSEwr?=
 =?utf-8?B?dFlZWjRHVkpwSzJGQ1lUak1xWThzei9pUFhRcWlPSW5tL2dpZjVqRUdNdUVw?=
 =?utf-8?B?UlR2MllVQ0pEYTJoRElrOVdobnd6NmE2RGJiOXExNWNHVGFYU2FwamJtcVcy?=
 =?utf-8?B?QkxyVCtVUU15N1hLMmluZG1oNFVrT2tMS2tQZWNyR3dDbUtIclFVdEJFTVhV?=
 =?utf-8?B?Nk5kb0wwYStpRi81NHQ2UUlJbjB6R1lZNFBhMkE4cC8rNDFsRkpvUEN0bmh5?=
 =?utf-8?B?T1g0Ymd1NlZnb1JHN05LSENuZU84RGVlZEY3UVJkNHRIam1FL2xTZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e6245f6-18ba-4dfa-b00d-08df3f89991f
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 00:20:32.4054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJBcpH9wb0YqXSgyAg3VBO+6VmvJDZNfgEw8Y7XaBz0L7MfqpPEpr9ERxpp8fCa287Wg2fz5KsNLOMyXJnBuFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR12MB999130

On 11/10/26 3:10 PM, Timur Tabi wrote:
...
> diff --git a/drivers/gpu/nova-core/firmware/tlv.rs b/drivers/gpu/nova-core/firmware/tlv.rs
> index 7f278903dc8b..75d8f907421b 100644
> --- a/drivers/gpu/nova-core/firmware/tlv.rs
> +++ b/drivers/gpu/nova-core/firmware/tlv.rs
> @@ -257,6 +257,23 @@ pub(crate) fn load_file(
>              .ok_or(EINVAL)
>      }
>  
> +    /// Return a u64, from either a 32-bit or 64-bit little-endian tag.
> +    #[expect(unused)]
> +    pub(crate) fn get_u64(&self, tag: &[u8; 4]) -> Result<u64> {
> +        let value = self.get_bytes(tag)?;
> +
> +        match value.len() {
> +            // `value` is an unsized slice, but from_le_bytes() requires a sized
> +            // slice (&[u8; N]), so we need to convert.
> +            4 => value


At this point, we have established the length...


> +                .first_chunk()


...but then first_chunk() checks the length again, and also returns
an Option that is never None.


> +                .map(|&b| u64::from(u32::from_le_bytes(b))),
> +            8 => value.first_chunk().map(|&b| u64::from_le_bytes(b)),
> +            _ => None,
> +        }
> +        .ok_or(EINVAL)
> +    }

Instead, we could use try_from() to check the length and convert
the slice, in one step. Your TlvBlockHeader::parse() already uses
that approach, and I think it would also work here.

Something like this:

    pub(crate) fn get_u64(&self, tag: &[u8; 4]) -> Result<u64> {
        let value = self.get_bytes(tag)?;

        if let Ok(bytes) = <[u8; 4]>::try_from(value) {
            Ok(u64::from(u32::from_le_bytes(bytes)))
        } else if let Ok(bytes) = <[u8; 8]>::try_from(value) {
            Ok(u64::from_le_bytes(bytes))
        } else {
            Err(EINVAL)
        }
    }


thanks,
-- 
John Hubbard

