Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793948797;
	b=noOrUsdacBrLuhQgi3LuJFw9XLwnqfQrcHrow8yUUmv9v8NMSnhzT6iYRgR70RATqDa3
	 Nkytz+Z3F5Vfi+GNEcTtTjqapg0R7Bui56jGdX27OfroyxJ/GV0pIiJcUVrMOSu8q+WWO
	 8h0FKQ6nhx+OkYKp+DZjhUDy8bBWBFgj2BKeL/3OwzTkqkByPZUbEoCuCi+1i9euiP/Dh
	 1vcLQ+sGnjzurgHgalhNMjS4AmvaZw3VCwFWN6QpgNd+sKWthzhzeH99zOe3Bx3j120lm
	 Z6ftq2KG4gMo7FY+E+KU1JTC2vUwyX7HXf0Y3rAvNXCj43J6Udn0763OPBbrIz8ZVyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948797;
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
	bh=mS6JJHYmPiJOrardCtlM13jmr+cJU5US+5bnvaSYytA=;
	b=Jwt8KiYwFZrwo88NwLDLVn5g1uMI5ouWfcbLZNZc27dXmeU5G3d3FWXUKdENuRECtFlp
	 I0CQmS6fJBSOTht+ocG0xSdhL+++aaZYjFwDhPQ5fHqZb52Bhrc1WQzjkkq/xN0QBLbKo
	 2fBY2wb8DgYW9o8DQFAV5tx9EEP5V2y2ApX5wGaffw7NIKPaoGiq2MUGULBic9LpqwmjE
	 W8uc/473X1UIHZo8zLS1hblhvqDCQWhMOKa2+0RYerpF0zs0aVlWI2BDyVldtX4xtr/pP
	 34XjmQywL4uTaaL+3tXecBRHZwbrSBcaCjcjf46y3tC/M3150BIuzhxTUmwjC6QMz1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=d6UWle0C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.31
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012031.outbound.protection.outlook.com [40.93.195.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFF9606A32D
	for <nova-gpu@lists.linux.dev>; Fri,  6 Nov 2026 07:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AFF9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=d6UWle0C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F66tPyGkDyk22A8lkqFNelTGjxJxApU4KEIymlC3oQbG/HnkKvbkEta25DxtbkqgVtF5nncScn2BkhNnUnMXGNFgAJwsZPHVsrhu0PaLS2rPTa9OBQfIh02HUlytosYnjzlO6tlSqTd5MO3dojZn0b5IhvO6xH89m/Ue7DGEGTN5YMUsoio2DVW3dwm/vAUZ4KfNYE5+v+tjupajogYF4/2c/0Th1JTG3Sxe1TpN4azV1o4QGhd3q8xYR0JR03wwWb8b1WBV3Nj2WYk+flK83eC49JTsDw+heAwH7pI9wIElY7wVjPojLdEqWZtG3+v/1Whkp2M1/Yg3gwDjTXEQKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mS6JJHYmPiJOrardCtlM13jmr+cJU5US+5bnvaSYytA=;
 b=MY4uCaJjZw0ORUPVzXQ1aWtiv6y7IM4mPngjgxYngNzuSCIJ5OGrCI0B7NheMWcpD5GoVWNGXWmwVy/XciVh1ByXRZ5/+TniFcSSQ7Qt1vy/uOjPPm9nQ1u/+bgGkCxzXublIE6/j79aj6GZ8OL8H//upzpXimTFHRz8/x7pjzZKJvBEYP6se6qm8/OSGkJQR7miCwoAuUV5cdV+EoLeUtpu/YnyXakdTb67MII8GGHDYZnLswcMa/kVWjjjqxgnvDxXHmWrGb24AZGC0csbEN8OqzO4qbM9zcoJQguKtWgGtiBJUNP1bBDM+FfSK+EgEYh+5XGfKDNzC1e5wMHVGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mS6JJHYmPiJOrardCtlM13jmr+cJU5US+5bnvaSYytA=;
 b=d6UWle0CiIbucEhBL8ZInbCDmthKzkXfTo1ZyWk8638ojbFfd13Kkl3Jw0zhprBeCZHVceI9Tp60DYbZ/GPBvw3gSjyRGGaRIfu9TQqXE7F0uFG1XLQwMFVNsOLesZ7D2JQTISWjwR/wd5Vk4osBJ5u8HJycjr5TBxIzN7+qb/6vyMsZmP9mpC61Obt+1LxKaN2YoiThHuE1OdAzuRXIyXjp1p4QCn+GOGqO041k3SRN3S1Z+aR2+BwFEr8rFs4RsACS3NOER5YyT2CS5PdKVTXzBSMM+LZsLbIEkpxopS6EwBt4v8yVlOg6vLngi37dg6PbHmSiGVv8ML91HAviOg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SA1PR12MB8699.namprd12.prod.outlook.com (2603:10b6:806:389::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 07:06:28 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Fri, 6 Nov 2026
 07:06:26 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 06 Nov 2026 16:06:12 +0900
Subject: [PATCH v2 4/6] gpu: nova-core: gsp: cmdq: move message trimming
 into its own function
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-r000_rebase_on_cmdq-rpc-v2-4-e481ea2168ef@nvidia.com>
References: <20261106-r000_rebase_on_cmdq-rpc-v2-0-e481ea2168ef@nvidia.com>
In-Reply-To: <20261106-r000_rebase_on_cmdq-rpc-v2-0-e481ea2168ef@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0234.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::6) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SA1PR12MB8699:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c90dc7-f4de-4780-026a-08df3bd47959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|10070799003|23010399003|1800799024|261026121527099003|11063799006|56012099006|261021123027099003|261021135927099003|261021121427099003|261009223027099003|261102123227099003|261022105027099003|261026140227099003|261028144727099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	jcWvf5Itu5XaEEnpcrbXLI6/44opfRNHUKjWdn6lmU7QZeRmTILLDtWaNVVVk+C2UTjSYmdcqUrH1RTEt2yE3spyUi7Jwl4+oLS9SVkewRuBjSe1gw9xy2k7O0YBDzZBhn+a2oITNSOIqeIlQq1zyhe7UdhEmG7L1uO3wR+MqcQrempUJGY/lJ0Bw0ALGXTcSzViTsrQjcnaTwPd8OiQ3me+AEuilBF8wH8LDSzCYTYSfizf8nwHfrYaBMAN3BEMHfq87r26ufpatZA0xVRGAqntIPk7A08M+3w3GpPGWf0DNZq3qpZws9LvW+Siz0daAdj/dkZODdUhT6P9uKSUbBss/yLHwRGHfCruvqqvOfAjkRtDSV33+VlygxI0R96ubKQQk6wvU8pRCvk0WuW6hahLeuwvxsNCZ+ADBT1xcY6nAshDsBlftunitsUlmOUoz/D66jdEgFZKgLwFRigSdw+Bci68YXxGrZHU+IQjD8XtMR/zjUjaTX7LjXbrfvWIOd7wnvVD6Yati0TvPSgs3vbkoHfd5DKQLXzZ1dARcLhOj8G3/Iwb8hTv74VeSWhMxKMfLWXnGUWtvtjNet9j99ZxBgoyWlbkMw7HzJL8y1wh4M+akLPEm3WDLJo7s4+NM3kzTjJWxYC8jcov6+xkiPYKBpnHEOLvTz2TuFXKuU4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(23010399003)(1800799024)(261026121527099003)(11063799006)(56012099006)(261021123027099003)(261021135927099003)(261021121427099003)(261009223027099003)(261102123227099003)(261022105027099003)(261026140227099003)(261028144727099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzlkS3dYRGppTFJNY0IvLzNpak9JeFNRRVZINlNybW9qUGswRmsrcW1ucERk?=
 =?utf-8?B?TnlzKzN5cDdBclZnUzIrRVVjaUVzNDIxT2dyWmtVVSsxMktuZEdYOUdrb1hR?=
 =?utf-8?B?Q0tqTmRRbDI1QkRQTVRONTNkdnZQMVplQ1J4U1VlNzl3Q0Q5WU5VYjlZamgy?=
 =?utf-8?B?L3VsWWxSYU9NekJ4MDVLNFhsQlM3TVkwNEVaOU11YWZiSGNOMFlhR1R1cGJE?=
 =?utf-8?B?OFFwaVRTakRBRldmOXNOZUk3OFZGY3Fmbk04Zmt6Nkw1UTEzdVI2ZGVXMElt?=
 =?utf-8?B?ellLQkRTT1FQNml3Q0RkZHdEc0lZOTlCS1RRWE96NWNWWk9HaHRMa1l1UEVw?=
 =?utf-8?B?Q01HbW1HdDhyem1CLzA3R0Vvc1JLNWczb0VQamgxWm9QUEdsaEhkR0tzYlNB?=
 =?utf-8?B?bmNiZlp5RUZ1YzFZYnBjT3krWFFhaW1QaUZlL3RVVkJEYmp6cFpZQjRsR1Nq?=
 =?utf-8?B?b0hDOGc3WEZNVk9oeUppUzJDSEJReTZJcjd3V2wrMzY0Wm9hdmJacE8wY0JE?=
 =?utf-8?B?VUhPY2ZONG1icUZxaG9LMUNweTVkUWpSOTNpb01wdkVpWk5rNWJkM0lVTXJT?=
 =?utf-8?B?aWFYRHV6aU0xdEtHRkFIMjJZeVBjK3VRU1pUbnBiWmtvSCtjejhhTjFWVUpI?=
 =?utf-8?B?c1V3d204SSt1WmNUSFptSmlzaE43cWU4SUpza2xTQ284Qm5Lazh0UjYyd2tn?=
 =?utf-8?B?VUNQMlZGQUFyZUxvU1RXOXRpcE0zN0l4endpakRmblM1SGhTVGVkeXQvbnVR?=
 =?utf-8?B?M0tBTmpNU1lJNGliR3RVaExCY0hEVUExWXRNcFJXM0Y5cStkQy9pWnE5L2ZD?=
 =?utf-8?B?WXhsblo1N3RkZkdqUGE3WjBnWTVwcXc3aUxDQTJEakkra2VXNSs0MmxjbVVi?=
 =?utf-8?B?c1paQlF1NFdHS3M3QTRJL0ZJUGc3YlVXVHlIcmRyeDJSN3F1ZUlzWXlBeERo?=
 =?utf-8?B?N1IrS2JhOGI2b1hkODIrUzY3WXFPRWxxZTk1Q3dhMG9Oam1JTUtYVGI1MU91?=
 =?utf-8?B?dDRhdzJvempYeHBvL085Z1FIcFpEamRhOUVyRlhUQUM0NUNCOHdxWUJLbGJZ?=
 =?utf-8?B?RU1QT25vT2RpSExnVGdYNmQrZHdnUnZJUStzQjBMUDZPMHdJRFFtbXhiZlZQ?=
 =?utf-8?B?TWczRGVBbVJZTllsU3VoUFU4ZFRXdmdWYm51NEx4QWVYNWNhTmpaZlJ1TDY1?=
 =?utf-8?B?TXRXTFJ2Y3BVNDVGN2xXcVI3QmdKNWc2WVppajlLQld4dEtpMVBoWTJGNFpF?=
 =?utf-8?B?ejIwVVBLMnVNdUIwbWpBdVdhdHdjMkdna1NSaThNaWJPRzRBWnZmanEzVDly?=
 =?utf-8?B?bm5tQ2xKY3RlZWxHSzN6VFRYZzNpQm05NTB2Q2ZLd3pxdVg2dC9QeDg2QkRQ?=
 =?utf-8?B?WHF0a0NmRWkrdE51TGVLUmNtMDVReXdSNXlxSzJGS25kaUZuY3F5RFpkVmhF?=
 =?utf-8?B?YzNJb3NjR0Z6MElBVFJQUjNod01mYUhWV0VrcDNWTlNZenhUeWp1MVNkbVF2?=
 =?utf-8?B?VEJoOUQxRmpFOG9NeFRHVjB6TURsa2RSNmpGU05aTGFqcGJRbjlkYmZ6elBQ?=
 =?utf-8?B?bDY0RVhRbHFLbVZBOWV0d09LMDNaeGZXNk1BSXNXM1pFWmtwSWpqbDB1TjM5?=
 =?utf-8?B?U1k2NWh4T0ZELytFWEN2UU1XYXJpdURnQTNUUmtTMW9qRUp1a0ZwSkxPWkc2?=
 =?utf-8?B?cHRFR1BPRmM4eVFDNnlDY2VHeGs5WkNQZll4UERaLzg1cEc2UEMvU0F2SFNt?=
 =?utf-8?B?aGNXTDRlK2lPbjRpdXRDcitlNkcyZlZTM05qajdLZ1kwbHhFZ1dnNlpWM0RP?=
 =?utf-8?B?QkcraTgrWUo5VjlUWE5YS1NtTHlMTm9UblZOMEdYVm5DeE4rQzNiZjVoRUxQ?=
 =?utf-8?B?NTl3T0h1ejMxSFhzZkFMN3BBazU5N3NwLzR6TlVMdUZST05PRWFnS0t0QWVD?=
 =?utf-8?B?VGg3dndpNVIvZlBoNExkYURJdDVHUHNwYmVTOTVjUHI4NUpnak8rK0tIS0pY?=
 =?utf-8?B?NlNQZG54bXp4VEdxS1lwTGlTaFpTVTZUaHlGNCtzTnVrUFhsd2J1NFFPU3Bt?=
 =?utf-8?B?dXFZV001YnZXVHJCUFE2aGdoMlVhUEtrRm9kMnhmRjdqejQ5ZkMwUUd6TFU5?=
 =?utf-8?B?b000WnRyK1hMVUxiaVk2cXBSUmJUalBrVlpKUkhaOW1LM0FZRWwzTFN4TEVU?=
 =?utf-8?B?OE5FbDNYSDVjSzdDL3BlM3Q2RGNXcm1yTEd2b3VFWEIxRllXNnRJc001alox?=
 =?utf-8?B?OXY4NnphZGVnTnFpd3ZjSDIrTzdVTldFMGw1aHo0R01RMzcydGxPNzJSTGpz?=
 =?utf-8?B?VEtpa284MW9WN1lXTTBtekNJOHExTDR4ekUwenErU3Bycm56VE5pdTZzTUYz?=
 =?utf-8?Q?dGh8aOuvi5MOi7g5Gya0cFam2J8YfQ1zHokCFRY9898W8?=
X-MS-Exchange-AntiSpam-MessageData-1: m4o2sMdZ6HFLow==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c90dc7-f4de-4780-026a-08df3bd47959
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 07:06:26.6032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OrIwBF5DabfJQ5j40xcpEGg3Jbv0fzy7v9P+7AA08PU1ATzzCVkVLyeUjLjFQCCXV+oF2CnWbuINLjLrrUwf9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8699

Trimming the two driver-owned slices of the command queue to the
advertised length of a message is going to be used by both RPC and GMC
messages, so factor that part out into a private function.

The parsing itself can be improved by leveraging `split_at_checked` and
`get`, so use them.

No functional change intended.

Suggested-by: Eliot Courtney <ecourtney@nvidia.com>
Link: https://lore.kernel.org/all/DMN62G2CDG3N.ETT4GRFXWKKU@nvidia.com/
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs     | 21 +++++++++++++++++++++
 drivers/gpu/nova-core/gsp/cmdq/rpc.rs | 20 +-------------------
 2 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 9dd11ac8952b..f3151aa8ea26 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -719,3 +719,24 @@ fn drain(&mut self) -> Result {
         }
     }
 }
+
+/// Helper function that trims the concatenation of `slice_1` and `slice_2` to `length`.
+///
+/// Returns the truncated `(slice_1, slice_2)` pair, or `EIO` if `length > slice_1.len() +
+/// slice_2.len()`.
+fn trim_message_slice<'a>(
+    (slice_1, slice_2): (&'a [u8], &'a [u8]),
+    length: usize,
+) -> Result<(&'a [u8], &'a [u8])> {
+    // See if `slice_1` covers the whole message, take it entirely if it doesn't.
+    let slice_1 = slice_1
+        .split_at_checked(length)
+        .map(|split| split.0)
+        .unwrap_or(slice_1);
+    // `slice_2` is the remainder of the message not covered by `slice_1`.
+    let slice_2 = slice_2
+        .get(..length.saturating_sub(slice_1.len()))
+        .ok_or(EIO)?;
+
+    Ok((slice_1, slice_2))
+}
diff --git a/drivers/gpu/nova-core/gsp/cmdq/rpc.rs b/drivers/gpu/nova-core/gsp/cmdq/rpc.rs
index 36cba7c28d3e..6ee28e93586b 100644
--- a/drivers/gpu/nova-core/gsp/cmdq/rpc.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq/rpc.rs
@@ -214,27 +214,9 @@ pub(super) fn parse(dev: &device::Device, element: GspMessage<'a>) -> Result<Rpc
             payload_length,
         );
 
-        // Check that the driver read area is large enough for the message.
-        if slice_1.len() + slice_2.len() < payload_length {
-            return Err(EIO);
-        }
-
-        // Cut the message slices down to the actual length of the message.
-        let (slice_1, slice_2) = if slice_1.len() > payload_length {
-            // PANIC: we checked above that `slice_1` is at least as long as `payload_length`.
-            (slice_1.split_at(payload_length).0, &slice_2[0..0])
-        } else {
-            (
-                slice_1,
-                // PANIC: we checked above that `slice_1.len() + slice_2.len()` is at least as
-                // large as `payload_length`.
-                slice_2.split_at(payload_length - slice_1.len()).0,
-            )
-        };
-
         Ok(RpcMessage {
             header: rpc_header,
-            contents: (slice_1, slice_2),
+            contents: super::trim_message_slice((slice_1, slice_2), payload_length)?,
         })
     }
 

-- 
2.56.0

