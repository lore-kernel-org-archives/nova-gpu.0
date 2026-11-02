Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793621409;
	b=l/YxeRmA9Qo4phB9Ew6ELkxB/6yV3h+CuIzJbmnCT0NS91dBR3q75WFqQrx74dXSIvWt
	 yBufd/cCpO6Dca+0p85LIUgFNHshMSAREsy5+pdApaCmxM8Fc8LFDx43OcuVe8eHrwq3I
	 KA2AIAk2FgtjeUYa6PjoSw+a6MQ1/5G+e/RzMfUrEvlcW1rgeLh6TnDxihCmzl+FuypuO
	 w4Iel7jhtwwnG/G92i5GPeEpeElSfyIA1FrPU3I+02Tuqh8XLCvWMdUiPqm9NEtJmdnqA
	 HIidzmcDefzcm+H9sNPb+qtCCdlgip/D+xd8VfSuGsiAVVczyDaOaPswLHcUvljSKqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621409;
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
	bh=PIs1PusGqIsxhvzbVXpZMb0ZKKbzRPLB0K/lHySlzNw=;
	b=JkwUb+mMAI2JZjomlqForENvOmZ2Xq8Z2zHiEgzaDnNz3MmRxDPVeepLDVtju3sVlp2D
	 0v0WcqZ4V/z25fG/nLJDQ6k3+Fhq087RY8iJKFxSLHvJiq+rOy6+SDzuTIfD+KLmNMbDw
	 ztOeyPc4QvsnksANaeF/xtipOXOLcl+wJKW7HNjeIlMfdY5DeNUx88yGKdBH7v4QAKKPE
	 r0NEJyQgk4fyN1eUYRh3k/vwNqTVcuLl+rvcroqFPbe+tEdffoIiys2EYkmZuPtPGqAZX
	 EOTDiy5AnTyK0gp44vWLa7+V+MrlDwcRFHTimYfnq4Udgy5ex2GR8S3UZByvAiGgSmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ENomgRJz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.23
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010023.outbound.protection.outlook.com [52.101.201.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC2D606A33D
	for <nova-gpu@lists.linux.dev>; Mon,  2 Nov 2026 12:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DC2D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ENomgRJz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZTNIHSGnOd2ljT3QUhdwcAQ87fQjX3xW8NQm1M6mdwN46xcWmmaKVshEAYhFz11s/TPTC+LKd091vhiN0TrvZuJjICrIS2ezQy1fBtafUunc5STIlYuy73zXFbHvGNTI5QeDeIhBN8Cn/WaahM7J8tA7z6Q2TtrKPUsQSDoyrYcDQlcnpu3n/k2oYHGzU29vbIMivoF8ovctbYrzpScL9hMIiZ7MPyMvxG1T6KP63dNTZVWPehS6UGzIJdiAi2YDYkgg4ywmzjF1pSMV2c2M1WN83tv+OsNDdaUtGIF4JCWNrHQ2fguCzMaJVXMlAoTkCfeLZZMzaUYxttFt7t+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIs1PusGqIsxhvzbVXpZMb0ZKKbzRPLB0K/lHySlzNw=;
 b=QDLzjfuGeQDqN8FdftP85RCvnMbLTpxwz8mbHZ+VSp0oGo6QsEUSmoRvFtTQCkYVTQ4D/IFa8/eijg2nGgIBLFiVQdxEN/9hxfjLCKfnHbN+KPnLJVN1phHJoKSmDnO1C3FNF1iUYAoy3K0LyZnPxs8UA8iIUZupMd6dMZpvgR7yFb1XxhNz79E+aWJCzdA4PIJFtf0XUATDAxMPdyOyHT/rf8ATS7e202qn8/wuRSKIhuPq72SgvD6YR6ePu+kI+rzzI3KkpULUM3mwiLTk4tHAcKWVTWS5LcoDDFQn57EpxpCtQIep/LVk4qeCF5E5GUCOvKVJzPF+KESkuePQbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIs1PusGqIsxhvzbVXpZMb0ZKKbzRPLB0K/lHySlzNw=;
 b=ENomgRJzI9z2OkTQtCHLMWvqHzcWuc897MPHhygSFZf2bkx3OZ6a0zAC7qx5EfA8ZUURQBIt8I7VdQiFbYPdljfwd/YO7ZaCdiOHT7hP+NpkFDQns7H3XpWM43XFghU6PoGPTUUrJyI4dsuf6uuavhyT54AKGx6QwcYpUVGwJtImKYeNpqo9R4ihmjLTvigSxldDiIcLoCjlXH+SGhgTgZnWvJR2/9S2Xgy1rL6dI0wgT1YsF1eGqLbw/CcWa+oRjJH7r98gyPSicx8kpmMZ6Yb/0ZLwNtlg3OpeTOqE/yLcK033Yel4HvOS//iQ313jeh1KclGIAji026wph8hFjA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by PH5PR12MB028906.namprd12.prod.outlook.com (2603:10b6:510:500::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 12:10:06 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 12:10:05 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 02 Nov 2026 21:09:52 +0900
Subject: [PATCH v2 1/5] gpu: nova-core: fix stride of NV_PFSP_* registers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-r000-cmdq-prep-v2-1-c2c2b69bdec0@nvidia.com>
References: <20261102-r000-cmdq-prep-v2-0-c2c2b69bdec0@nvidia.com>
In-Reply-To: <20261102-r000-cmdq-prep-v2-0-c2c2b69bdec0@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY6P301CA0013.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::11) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|PH5PR12MB028906:EE_
X-MS-Office365-Filtering-Correlation-Id: 48c61d2a-eb12-4dff-1906-08df38da3b2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|10070799003|1800799024|10067099003|18002099003|22082099003|56012099006|261021123027099003|11063799006|261021121427099003|261022105027099003|261026121527099003|261026140227099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	8qUdbr/tVi2B3owT4Io4dkCNY2WOoq1ie3KpRk5rM2B4uuHr9gZDYoK/Bx79IQiquDxFVyodkGo/VUx+O7OD5QAKAjsOJKivsOZhA+t1aY7KSqA29EEfMmmEU7v0r+uQLCyVL8/wuCKlL7B/fKDf7hgFS1M02E6oA+VttDZOqVXm8waLWSX2VJl78eCGGTVS1PvxJqjwA07dIzYKNxcPPC/S9DfZhEcJLhi4P6h/NTXWPAOuhy5GMf9bzfqW5Y5UE6JmUvd7lNLAV84PvO559NFV9sZODa037HURQBcF+m9xw+BQC23Z/iGTtGSB5hjJC3nAeowLe9YTlPRUeis4lCB9mFWe//4Q3rbjdtn0bCM5bfxzycYdA2X4+FPTuQR8HttV035IviRzFiJl9VSuUVH0OEI2TFY+WHRinA5SXRfOypnR2vxUrhx8n0EUc//8cwcAhtjsZcJoktRS8UaeyNz55ZStCCX6/Nmcv3iSHqqCe0tOAPZQQOHlvwX+Mbm7SczRcAJwVmW5PVqIXgeAZ60Wx8iIQg8zC27Hs2KV81JWVPHDbHFl0/3aTSr4xnmSdjmenVgjzdzUn8WyaYoSuEmF/nBZFW3CPuYOiJvDtkYvCViu1MVehzUXm0cL+hg8/7Ih5Gxvvh/LBshD1Z9qy+TdEtH7UkDi7XHLFGgpHVo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(10070799003)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(261021123027099003)(11063799006)(261021121427099003)(261022105027099003)(261026121527099003)(261026140227099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjFidUFwNlFVdFJTY1h6N1FNMGV4cWZDVGR6ZDBBU3BPTk11bFBXVWpVenYr?=
 =?utf-8?B?bFpxZy9QZm9VUE4xWGYyVWZqSzRTTGlUZmNvcSs5aVBIOXRySjRlNHdRb2xn?=
 =?utf-8?B?ZHNzZ2tHU2dLUWpqOFdESmNZeE1DbjhZWVRMQ2lkV2hYNEI3TW5sT3pjQWhi?=
 =?utf-8?B?ai9jZG5UU3FmSmNmVkQ2VnY5L3IyTWhmd0pBMTUrVlMwYUFxYVZqQ0ZyZ3VS?=
 =?utf-8?B?UW9DajJ3Um5XTkVINnRNekF1am1LRTFRM3hvdUdNTVNLNWRjcGMycUt6ampB?=
 =?utf-8?B?WVdKTlpLTHFkZ2ZidzBSSEczeWNIeGkwb1pEd1RvZHRXUTZIMW9MS2FDSkpr?=
 =?utf-8?B?a3I1ZzhZb3VWcURGQnZoeGtZbElXdWQyOVBFY0UwOVFmRTRnTVVDWm9uTGxD?=
 =?utf-8?B?UU1DcFNqcW43SjY0R1U1clpJUHZTQ2VDYXp4NnJQRHI1WGRSaFlMLzdmVUE2?=
 =?utf-8?B?ek1rMUhaZHA0OUVJVGxVU3dlMG11a25jVTlSRHFFSG1qVU14ZlpuTVUyK2pi?=
 =?utf-8?B?U1N5eDFTcXJJQVJSVDUyamtYc3M0LzdTT01BblFVSlU1WWRLQUxQN3BKM1R1?=
 =?utf-8?B?UkIyUWluaXhiZFlOOElRU0hiaUY3QWtJNHRacjR6a2ZhbklpeFRRNmVLdXp2?=
 =?utf-8?B?d2VRRnovYlR3WnVNL2duZEtqMDVsbUxYeXFqNmVCc1BPRStQOG5jWlRsdExX?=
 =?utf-8?B?d1RJYStMZVdKMkhWM0RBRi9tTUcwRWdWWWM3U2dQVkw1R0RVcUx4WW4zUkNu?=
 =?utf-8?B?QThuME1QRmNHc0VRNnBKQW13K05tUDN0U00vNEZ3b3V3NXZiTGw1c210QUpv?=
 =?utf-8?B?Nm5hM2xlWUV6M1p0Q0NRRjZGVW1KS2FmUlhQdnRUeWZsVzJFZHViVGkwV3hJ?=
 =?utf-8?B?RmptMSs4eHpRRGxKVEYwQTRZdDhIRG9pblFEc1Fhd0NTSFhRQ2RwOXFlSTI4?=
 =?utf-8?B?ZmhDZVVZSjhqNzJvd0RzaTNJQ2Jxa1JMRVU5NlZ5T2VFRjd1MW8yTW96RHl0?=
 =?utf-8?B?RDVPWmlISVlmeEYxSCt6K1Bpd1IzYXlPZWVMcjlTRGd1WDdTR3VZWFJWMnFq?=
 =?utf-8?B?RFpHRVppYlJ2dTQ0T25Wd3lYc3ZCMDZ3c2h2UkR0STRJZjRYOUlKTVFvZmlY?=
 =?utf-8?B?cUl5dENGdmpjVXlhSVVuSk52bGY5UHJobndQUno0UDlkV05hRUt3ZG1XcnRw?=
 =?utf-8?B?eEpyQ21MQ2FUc21wQVpyRGYvVXBiMXQyZ1R3emZ2YUo0anlraitQMmlhZS90?=
 =?utf-8?B?MndkWm5sL2ZxOGNWRk9qeHA1a2p1b3dRZkY0Y05tcVJrM0hqOFVCc1dNanFX?=
 =?utf-8?B?N05mZ1FEbVF2OGYzSGxUUXNmV0FSWVZvK1BOaGFCTUhMbGErbDRHVnEyWWoy?=
 =?utf-8?B?VG9KWHc4MlVaWVNvZGxoRVRPRG5SQ0c0R2VnczgvWlQ1d0FSY3Y5MHF5ZVpG?=
 =?utf-8?B?Ukczc2Z6QjExTWZLMHkxVkhIR1A3cnBDdUMvaGRYbVYvWUJXQ1JSLzNZM2xv?=
 =?utf-8?B?T2NMM1hJaURzd2RuZVNvT3gyY3FXWFZBUUo4V3dtTGR6M1NWRkFGcTFqa0F2?=
 =?utf-8?B?U3RtNUxyNVZjVzhNTU5JR3hrdVNIWXZBWUJZWklsMmwycHpVelZ4TTRkTDdh?=
 =?utf-8?B?MlRvQURvNWFTZCtGcFdwNUNjdEw2S3h6WWRIZFBtcy8xZi96cmhvWHVPbita?=
 =?utf-8?B?blFyK3RSSFlTQWZxbEJJU0pBT05QcytlNHNnWDhWMks2K1oxMFJWVEcwRzdy?=
 =?utf-8?B?M2Q4VHI0dG14eWQ1cVdINElMalA3NksrRWZjYnhQRjkwNkhBWGNwV0VRb2hh?=
 =?utf-8?B?TW9jc2JjUDgwK3BodXNnRndjZlI3eTlpYTNRdTFyMncwbUxjVUVoZW1pczRt?=
 =?utf-8?B?NHE1QThnSjhGalhIM2w1alZYTURRWjc4eWJXTURVK2s0VWZIcHRxTG81cy90?=
 =?utf-8?B?UlBvSzZjbk4zS1dNUlRBM0thY2ZGUDNCdkhvRzNkc3VrR1k0OFJXN0NrcFpB?=
 =?utf-8?B?aVNkbURnVXFLemtpOWgyN3l1OTZJUU9RUC9tUHF6RkRZWndWdmh1UVRvcWhk?=
 =?utf-8?B?QkhCUFlPZzJmbGJNeUpYTTdkb2JOMitEOUw4TDNqcjcyUnkrMUdRc2tqWXND?=
 =?utf-8?B?c2Y2MFhuc0lIVU5aZFZpUFRBYmM5MStqQzNsZWU2MXBmMjBGWlJ1VXl0U2pF?=
 =?utf-8?B?KzFrVkxnMTJWS2dCOTN0QUdLWmNLSTR6UE45V3BCTm4vVDRFSFF1VmFTOVNp?=
 =?utf-8?B?dDFMREgyclRCaU93RzNjRUlGQ0hSYmtWUU9XcDlZZE1Uck4zT2ZUTngwZVNj?=
 =?utf-8?B?VkVMMVFmU3N4YmhpWnhUVjZvSDVJaWtlMlFyNEZDTHhacjB0dkZ1Rmw5cGZ5?=
 =?utf-8?Q?8/HH1mjNOrLBmbZxLCy3fjf240lYlZsJPHSQbDw8NLlqt?=
X-MS-Exchange-AntiSpam-MessageData-1: EmPGmMo1F67YPA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c61d2a-eb12-4dff-1906-08df38da3b2f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:10:05.8369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ae+N7uhWRogTkjQVnzLTCJgUELicgtoxhrz8OgoiWqNBG+xUJQ8BUWOnsiLEi1p/Ik8SSBNFV+kaDbORl0G+2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR12MB028906

OpenRM defines these registers with a stride of 8 bytes, so reflect that
fact in our own declarations. That inconsistency went unnoticed because
nova-core only ever uses the first register of each array at the moment.

Fixes: ab42c32347ef ("gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure")
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 88662da634dc..df2eddc58efb 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -402,19 +402,19 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
 register! {
     base: NovaRegisters;
 
-    pub(crate) NV_PFSP_QUEUE_HEAD(u32)[8] @ 0x008f2c00 {
+    pub(crate) NV_PFSP_QUEUE_HEAD(u32)[8, stride = 8] @ 0x008f2c00 {
         31:0    address => u32;
     }
 
-    pub(crate) NV_PFSP_QUEUE_TAIL(u32)[8] @ 0x008f2c04 {
+    pub(crate) NV_PFSP_QUEUE_TAIL(u32)[8, stride = 8] @ 0x008f2c04 {
         31:0    address => u32;
     }
 
-    pub(crate) NV_PFSP_MSGQ_HEAD(u32)[8] @ 0x008f2c80 {
+    pub(crate) NV_PFSP_MSGQ_HEAD(u32)[8, stride = 8] @ 0x008f2c80 {
         31:0    val => u32;
     }
 
-    pub(crate) NV_PFSP_MSGQ_TAIL(u32)[8] @ 0x008f2c84 {
+    pub(crate) NV_PFSP_MSGQ_TAIL(u32)[8, stride = 8] @ 0x008f2c84 {
         31:0    val => u32;
     }
 }

-- 
2.56.0

