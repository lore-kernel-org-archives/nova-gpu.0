Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794044940;
	b=z7BuZ/GQICXoK1VXv6XIQIIFTjesYC4wq4P5yQvjO9Z/q2ifs2VhSNsREwwu96aKnyvn
	 pYUKx8JaT7zGecpn/LWFSJSiSPRtlmPosYEOftEeyuR/RwG5wE6MPeCHSP+Em2ljBWY8E
	 EyxEA0kBqBQvVZ+NimqL/MJgDWjxAGXX8z/v3nS5ukUPyubuolgpLuwb9oXwfzeW2l0V0
	 Yf3ug3l0eqF+QFKOdZxfn81Of0ZJDwRXGVU4jkosB008c96RXYzdsgtvt+C0YxcK/G73d
	 OFPvWDYeECn6HuSs+wcnxZYbjTZ19lYS9DtpvRXyHaV7wqf+nUfdZ9MhuSb16UwgdQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044940;
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
	bh=EYU8jR9QkD7BHWfpofFJX5Cckf8qt9WvBqvgxSfJYjc=;
	b=jaRUE1GzKF6d3wBe+KLIz59KSCthuPc+ePMgKAzGzvTYoUOCyKmf/tkv/KtJc3JPNOhM
	 6Zi08N9OowGFC8c0carOQbBEQ7O9hDTmoVqPdmstGsCo4xlwMyXM/qL/A9daYUkZbu3LZ
	 tmULWVbdFEoKQkHfuf+YxWG5HTihJlLB+UsnUYNLamk8dXYfc9MmVu5hb59YNnWHQSKDO
	 PRNWD/4zNWq6ImghhGaft9yM4awCYIGyB9/sPKFiOBYjO3PT37pi85sZq5+1Swn/VaqF3
	 9Ae7OCZkhwGMYEDq+4yZOnWcYDj4SYOgjJprjhVcJEA9tsQ2/V9vtVIoah1C5UtD9dg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=C8R1Uqnd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.46
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010046.outbound.protection.outlook.com [52.101.61.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FAE606A337
	for <nova-gpu@lists.linux.dev>; Sat,  7 Nov 2026 09:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28FAE606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=C8R1Uqnd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jfx4lPwSxVke6QS4oaDQoMDlT61eewjWcd/tiIVtBTYqxepq8pY7IMOmOi2PjILK1Dq5KLKZLHVXC7puv8Maent1H23enJ8sooYdeS9Y/T3guIjuayFCwcPy+gQxN2u5e49+Wlmd+YLylvSUKIZaQLw+JAH4FVxYLbC46nC0jzaLvUJIwmA8AUTG5G9dBIJFb1Ilst/4PAuA4ipDqiBEuVXvsxWdIDRybg1E+7Dtz4wOA78uiPBHuMEi+tn/oG0LqH9c25i46wLa4nNiIOoREf59qD6FpGdymIyBUXA1tfSIZPXihAY+jCishAEHR35fMdf3SHLLRw1LKtaX2SE94g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYU8jR9QkD7BHWfpofFJX5Cckf8qt9WvBqvgxSfJYjc=;
 b=o9t709fiWhlQj848hq0J2hvP4YQik1CCcmsV2M/QI3b2CwLtFaKnpzHY6JELjGYbbOMptlDPEhZyGyojyMwUOIwUiwF6vpGaK386/Vs+67sw1vJsmmzreQtR6ayMS5pNjABhPOZWjOKAkpQBwmNn4o9klUPK9HLsFe3BQQizTvYX5gPwDFgK66MWSmnpGMbHqxRJqo1aTa85Py9qlMzIh1940FScmstH1wmTl3QDDxP0Pdl5zL5Z83Y632N4ySRJ3w+uV/5HpG9kxngOKIuyGmpWT14ay5x0XSnCoS+ZeeGLuhJOL39d5Q6MBrJzJAfH4Ab7FefR075HWWhJVMsN5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYU8jR9QkD7BHWfpofFJX5Cckf8qt9WvBqvgxSfJYjc=;
 b=C8R1Uqnd5cTyuetLRjngbxX0N+aTjHOiSxcRZfltuHYeu8grtB7p5I4NZL0H3SHal1+wRKDHgQlCoAUBa8SvtKMHYRZYvPvtVY81Nwp/bqY2fBecLS3hTIVLcwA+AXHPTedpptdOYiT8zVKOVESZAz+A8fXOT75msF5EbPDqqKLoKeJqjz06U+tXCbxeRZ05IhvPcww+pFzh0QjdSabpEOjfWa6dCyIVpshSjD5reyEbOIIFjra8kUSIUIqUDbCEaSlLNHKohICXWbE3uFy7a//XwvxVeO/5vqjXLC+Csp2IEXX2hkUc6kflaY5+OV3JV88KfCUKerjpvtaxNZ/m7A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS0PR12MB8269.namprd12.prod.outlook.com (2603:10b6:8:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 09:48:54 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Sat, 7 Nov 2026
 09:48:54 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 07 Nov 2026 18:48:06 +0900
Subject: [PATCH v2 10/12] gpu: nova-core: falcon: allow DMA transfers to
 read from a framebuffer address
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-r000-fw-v2-10-fb37cc5b20cd@nvidia.com>
References: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
In-Reply-To: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY6P301CA0009.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::6) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS0PR12MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c6e106d-fe96-465a-1254-08df3cb4560f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|23010399003|18002099003|22082099003|10067099003|6133799003|3023799007|11063799006|261102123227099003|261021123027099003|56012099006|261021121427099003|261022075727099003|261022115727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	OYsIDAcRTNREMoSEaTzXL204J9sxclAXFGfTkrUKUsTOyVdMqlH91p+RUFMeyVvNI8+SNEFK1D6vUnUCf6NFgPPFY5NIkmsoorTFk2Rvon2y7iOyq3XEgSCzH56ge5J22yJZbRfrKVF0Ac4kmyMtZRJEDdUZYnr2ueusxbppcbOb6L7cU0+PLRrHPM2Yi0083u9vSk7f6TOmPhh6KbzS47sEd9I7PtCWKvVqchivZfOKon1PpDrVOSq1AThpLALtRcJBgMZM4mrrawemSuV+vCPJaGc/uIRTX92Ejbf4dLhtwiERQn2HEqn8sJHaSzv/jc7Bfap0JKBLfUISpvG2fBBFwHe1X70tNn280zxJ4gOgK5jbEoegPrn5YFAvKyUmo+1FJp5Uny45yBb1PK0kjX0or9+5oq68jConPrCzfiGPQu+7YHswBmfMAWEx5EQxtzQNqmyj+I+YA+V5ISNgv91d8+xxsTAFy7N4NJiX07K2iLt6pnkqbwFf8DOGcsBaVlx2KQe9NF0oYp1YjAQpz46i7I1leIbPfEd8cS0o/VOJeN2L27c9pZzsWAlBgmP3ADQNjbp/JpUIDgGrlWsZvQ8LMSr76EeamrJM42ztFsSEySDj6pa4eXHIg7d+CxcUVuxyKpA5O6hm6feLKszvamYDGjqsInQ+SSFjkhnhzaw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(6133799003)(3023799007)(11063799006)(261102123227099003)(261021123027099003)(56012099006)(261021121427099003)(261022075727099003)(261022115727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFltVUlHYVA0ZWVURHVsUTlTYmFZZFhWSnhBTHZtL3JiZTFqcHcyVldpT1Yy?=
 =?utf-8?B?dEJlbE1TR0ZqWXFQaUJMUDBZbEJ2YXpmZmoyMXpzS1NTWlR0RXFMQTNrRTla?=
 =?utf-8?B?TEQ5T25OYUo0Vm5OUHI2dFdFVlVBNXZxbENaY3g3TldPcGNtSmFwTW03MGUy?=
 =?utf-8?B?b0kwN3dVdGV0QllKaEF5K3BBVkVUSk5rWVB0cy9JOTRFV1BobDdDM3VKNHps?=
 =?utf-8?B?QXpVM0JuUHJiVWNIcWptbGd3ZkprS3pqd0VKLzFzQm9VUHhuMkJrOUlKOHZP?=
 =?utf-8?B?aVNLelAxMm42VFBsTDJaTnlBTy9jLzVkTUpFU0M5eENDdmZXZU1GUDFpMWpT?=
 =?utf-8?B?LzBMY2o2Y0FNRUdpQ2IydHp4SW1JMGlXUldReTlUMm93bXIvMFNhQ25lZlNP?=
 =?utf-8?B?aWt3dDhPRjFOR2xMK2hGdWlrRHkyS3dtUlJFcTVINFlUOGlCb0NiR05zb2ZC?=
 =?utf-8?B?Ym00eWZaMFlnRHkyYmduSzdjS0JEMmJYV1FsbmNCZnpMNC9uaTEwWDBVempi?=
 =?utf-8?B?RVJuK0FTc1d3a2JkMjhPTGRvSlZBREJWSVlwdUJBQkZDR0ppREVrQnZNemty?=
 =?utf-8?B?VWdYRlA5ZXpWZE56aXNEYWhROGRlZUk1ZHZwdER2YzhSeHhPZnRSN090c1Fa?=
 =?utf-8?B?TjFzRVBPTWpNUVNKS3I4K2xMbFRsRHc4V241OVEvQUZCRGlhZ29jWTJvRlJ2?=
 =?utf-8?B?SlFydWpLcERJWS9ONm1FZlZ1YlBTY3FwaDJuT3dHQ2pjRDREcStuQi9MOGlp?=
 =?utf-8?B?aXRwVkJLWmNCOHhYandZeDg1NmpRUTQ1REhTdVU5UG9ENjB4V1RiZi9IQnZs?=
 =?utf-8?B?M25TNnhWaFFIQ3pURGlJUzArNytrL2NzRDd0aUE1SXlub2c4L2hIbmpuSmpM?=
 =?utf-8?B?NXg5Y1lmTk5NTWVQc0dqRU9weVVMVXhSN1FpSHNhQ3NuK2N5d3RZQzJHQkJh?=
 =?utf-8?B?eW1NM1FOMVJVbEJrV1lYRko3QVB3MFR0RUxYSmtWQ2F3NS9MeXZFSWs1NmY1?=
 =?utf-8?B?bUVBRVBsTVhoT2RKSnBRckNYemhSRDhMaE12c05STWNOUmZTRnJxMlU1bTI4?=
 =?utf-8?B?VDNjWG5JbmNscmtHS29SYm1OK2hDaVJOM3ltaTJ5Y0J4MEFBb2R5TW1Mb20v?=
 =?utf-8?B?UVJtUXZ4N2VoYkV4VHVHcXFsMXNxL3hXRmNwTkxuaWpJS3FaMmVYY3drdmND?=
 =?utf-8?B?eG9Tc25uTFhveGN1NDZqQXZzd0ZiSnZTTC9BV2VnVFlJdDFYOFVJUUc3aHNi?=
 =?utf-8?B?OTd5NDF1Ulo3WWtzL1RKTERqdDdPNmhIRGlrMlNoR2xxVmpsTnNxcXhUUmF5?=
 =?utf-8?B?amtSdmhOVHFpMlJ0UGhBV0c1aE1GNXUrWTNwWEhjcVNSbmc2dTRGWGt6dy9z?=
 =?utf-8?B?bnRMS01yWGM5cytuQi81YS9GWXpvNmFYSnhxb3FFS1BNOC9pN0ZKMCtLSTBB?=
 =?utf-8?B?bzM0UVM5eTFtSm5LQWdJSlQzdE9BUHpYbktxVHBUbmhUNWFKVDdhN1BiYmNC?=
 =?utf-8?B?QUxBZWxDTngxRjNFOExIcFZwbG53ZVc1dS85a1UvSlduMkdhVEdocXNWRWY2?=
 =?utf-8?B?S250RTM4OVNINEl1dFMzQzZ1d09hTlMxMG5aQW1NU2liR3cwOTBIYlU5VzRj?=
 =?utf-8?B?a2ZBaEoxN3FJbU9mMFNpSXBLQmlZUlNjUHdGV1JtWUdldzFUUGVEVXB4dlF2?=
 =?utf-8?B?aHJMcGo3aVZ5ZHZvWkVqdnpicnZNV01odE54a00xakp2M3RxdUIySVlUMXUv?=
 =?utf-8?B?N2R3YWdrazlwbGJZNGpGNVlmWHJJdmd0ZWNnQVFwS1NIZi9YUjVkcWdWZWRr?=
 =?utf-8?B?VGpVdjhyMVo0VDkyM3E4K3Q5YjJ5UjhENkpqYklYYW5FS1cyT3NMQlJlTW4w?=
 =?utf-8?B?K3YxM08vcFkxa1ppOUlNNnEwMXF6QUJ6aWtudGFPVVhiZTZ3L0ZkU1d3dS9E?=
 =?utf-8?B?TUI2eUtqVUVWeFYyeGtpWXEyb0lDVUF3YlN4VTN6NTNkS0VzUDVIQlhCQmtF?=
 =?utf-8?B?dEc2M2JGTFZoSWlWVHRYUGkwUmRDVkNKUEZNWDhYVm5pWjg2MlRPUDJRTEZD?=
 =?utf-8?B?NnljVTRTK0ZIcnJ1SWg3cU0raWI4SC9tb1kwYmUvdHN0NmMvckQ1eFBleUFv?=
 =?utf-8?B?OTRLVmtEQklOUDZGejB3MlBsMU5uSUpIeHB4RWdRdWR5dEg1am14QkxldWhz?=
 =?utf-8?B?cy9lK0cvcmlabEhDUWk4SlZhWmtyc1RlNGw2OEhFUUViMWVrM2hFdDI3cEVQ?=
 =?utf-8?B?WGswRjJYR21yWCtnZGlFd0R2bFYxc3Bva3NNZ0ZsRDhvRGcvZEsxL3JIZmoz?=
 =?utf-8?B?VWFuZ1h1RTdYU01RY25VTWpTYzJXRWF4Wk9tN3VOTlVRRDBycW9ZQktKMU1a?=
 =?utf-8?Q?KU76z4LWWcyDC3IFkcOs99tRATZI22IAjYy1Mp3fzI9NB?=
X-MS-Exchange-AntiSpam-MessageData-1: sbSDgco18Nb/bw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6e106d-fe96-465a-1254-08df3cb4560f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 09:48:54.6424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ubcXMeDiGclj5/k0yl0i8IHVmB2fr1B+Ln8twYenZzkrJzMuldW+Sv9e1Zda6uAhDhYEQANEvHb7S9bF0gGHVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269

The r000 boot protocol has a load-and-execute event in which GSP-RM asks
the driver to load a Heavy-Secured binary from framebuffer memory into
the GSP falcon's memory by DMA in order to run it.

Nova-core's falcon DMA loading method currently only supports loading
from a DMA object that the driver has allocated, so there is no way to
copy an image from framebuffer memory that an event supplied.

Address this by making the source of a falcon DMA transfer an enum,
which can be either a DMA object, or a GPU framebuffer address.

The framebuffer address source has no user yet, but will be used by the
r000 boot protocol.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 65 ++++++++++++++++++++++++++---------------
 1 file changed, 42 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 00da664887fc..b63265abd263 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -140,6 +140,15 @@ pub(crate) enum FalconMem {
     Dmem { tag: bool },
 }
 
+/// Where a falcon DMA transfer reads from.
+pub(crate) enum FalconDmaSource<'a> {
+    /// A DMA object in system memory.
+    Sysmem(&'a Coherent<'a, [u8]>),
+    /// GPU framebuffer memory at physical address `base`.
+    #[expect(dead_code)]
+    Framebuffer { base: u64 },
+}
+
 bounded_enum! {
     /// Defines the Framebuffer Interface (FBIF) aperture type.
     /// This determines the memory type for external memory access during a DMA transfer, which is
@@ -544,13 +553,10 @@ pub(crate) fn with_fbif_transcfg<R>(
         Ok(result)
     }
 
-    /// Perform a DMA write according to `load_offsets` from `dma_obj` into the falcon's
-    /// `target_mem`.
-    ///
-    /// `sec` is set if the loaded firmware is expected to run in secure mode.
+    /// Perform a DMA write according to `load_offsets` from `src` into the falcon's `target_mem`.
     fn dma_wr(
         &self,
-        dma_obj: &Coherent<'_, [u8]>,
+        src: FalconDmaSource<'_>,
         target_mem: FalconMem,
         load_offsets: FalconDmaLoadTarget,
     ) -> Result {
@@ -563,23 +569,32 @@ fn dma_wr(
         // For IMEM and tagged DMEM, we want to use the start offset as a virtual address tag for
         // each page, since addresses in the firmware (and the boot vector) are virtual.
         //
-        // For untagged DMEM, the start offset is folded into the DMA base.
-        let (fb_offset, base_offset) = match target_mem {
-            FalconMem::ImemSecure | FalconMem::ImemNonSecure | FalconMem::Dmem { tag: true } => {
-                (load_offsets.src_start, 0)
+        // For untagged DMEM in a DMA object, the start offset is folded into the DMA base. For a
+        // framebuffer address, the DMA engine adds the start offset to the address.
+        let (fb_offset, dma_base) = match src {
+            FalconDmaSource::Sysmem(dma_obj) => {
+                let (fb_offset, base_offset) = match target_mem {
+                    FalconMem::ImemSecure
+                    | FalconMem::ImemNonSecure
+                    | FalconMem::Dmem { tag: true } => (load_offsets.src_start, 0),
+                    FalconMem::Dmem { tag: false } => {
+                        (0, usize::from_safe_cast(load_offsets.src_start))
+                    }
+                };
+
+                // Upper limit of transfer is `(num_transfers * DMA_LEN) + load_offsets.src_start`.
+                let dma_end = num_transfers
+                    .checked_mul(DMA_LEN)
+                    .and_then(|size| size.checked_add(load_offsets.src_start))
+                    .map(usize::from_safe_cast)
+                    .ok_or(EOVERFLOW)?;
+
+                (
+                    fb_offset,
+                    io_project!(dma_obj, [try: base_offset..dma_end]).dma_address(),
+                )
             }
-            FalconMem::Dmem { tag: false } => (0, usize::from_safe_cast(load_offsets.src_start)),
-        };
-
-        let dma_base = {
-            // Upper limit of transfer is `(num_transfers * DMA_LEN) + load_offsets.src_start`.
-            let dma_end = num_transfers
-                .checked_mul(DMA_LEN)
-                .and_then(|size| size.checked_add(load_offsets.src_start))
-                .map(usize::from_safe_cast)
-                .ok_or(EOVERFLOW)?;
-
-            io_project!(dma_obj, [try: base_offset..dma_end]).dma_address()
+            FalconDmaSource::Framebuffer { base } => (load_offsets.src_start, base),
         };
 
         if dma_base % DmaAddress::from(DMA_LEN) > 0 {
@@ -661,9 +676,13 @@ fn dma_load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(&self, fw: &F) ->
                     .with_mem_type(FalconFbifMemType::Physical)
             });
 
-        self.dma_wr(&dma_obj, FalconMem::ImemSecure, fw.imem_sec_load_params())?;
         self.dma_wr(
-            &dma_obj,
+            FalconDmaSource::Sysmem(&dma_obj),
+            FalconMem::ImemSecure,
+            fw.imem_sec_load_params(),
+        )?;
+        self.dma_wr(
+            FalconDmaSource::Sysmem(&dma_obj),
             FalconMem::Dmem { tag: false },
             fw.dmem_load_params(),
         )?;

-- 
2.56.0

