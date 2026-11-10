Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794306092;
	b=uR8r4ijyeiPFl/fWtWts7hplZDexm749oLrTWXA04ToNfv9Vq+JMx/8s9epYubGfNWD8
	 SO/9x+7ivwq96TZVBwwDYKQkR9RgfmY6Itw0MK+fUrubgHGzAWN16Lbp6fHKTWdH9Bk8F
	 igMIxLVVD/LJ8RLJcUHEHip0a6uHbhf2uZyWekHIbwVqRjh1bYmhRBpaWR3E145YaNu0l
	 LMICiJuoTqLn2tVvKirqiqF112X5Ohw/9fqPEcdaFrVSBjtak5hF5DlpBMHQ076a1Eeep
	 vyypjk7yWj/VtWVrYoqN+KDqsBp4T0RNvPCTIBbpCdZ/KrgWWhqzZedidKoWY0XvDQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306092;
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
	bh=ejogFBh0YipImsUvVvsj0BBL3H5nx6UPAUQzUcgKafQ=;
	b=MRqW2A1C/WxaktTC6/TVjlfGEbAUm4upaKW7qcEL/hflfHBrsHI2d3lacGr+0DGOHYIo
	 wbpbpOp6hN7Dby2h8aph7ymQKuaXQh0HWRkl7iG/8uiVnNcbTGng0UoKtQGv9gVOtLMcI
	 HIfuMzFiXZ9TdsLHTp9BvxEq//X1gRQVe78o3hZjmdDhWz0Yc29AtA0Viq3qb+gEWRUZl
	 Yhmg3sdPaWBs1Qd+kN68h2DsK9hNCpUbdkKN+rH/nMBW6hJp6O18l1DpoNs24SS4REgEu
	 rJFkmXrwMSAnkuRXQA920I29rf57M/S1NmeQS9H0oUxl/DAn5RGgfF+Jx+yjvFBJjUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=p3h4JRXk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.39
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010039.outbound.protection.outlook.com [52.101.85.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CEA606B98B
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 10:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64CEA606B98B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=p3h4JRXk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ur+HnQ6G97l16ISX+C+TmVWq9exYT4aVhI2F7vv7s92b+ToHei41jwlOWRMvHlOflPGK/cbOkxZY4ZJftt0NkXL8Ues97/5Gi0kU1PgANiVFQ8qu78zxlJ54MEhvyNFH+hMhYQsMiC6GyIh9uP8Xxtt89A3fQ6hRbIwcPJNBeXKJdWruBfdMeH0aGfBQHGIq2QCBrTL+cGnX0P8McW0t/D3wlrM5iPE1eVw1+3BpVrbkQqTae88DADQQCba0S7VJX4CZH0kvlo7iYs4MmcZH8KRvzoSD4iGcp6LXU4YCRTofzKtVHPKq7/Lad1+G/Gj5xDWO/W1Vn0zEl8xyhfwhow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejogFBh0YipImsUvVvsj0BBL3H5nx6UPAUQzUcgKafQ=;
 b=NAopzVV8kvvRUql1ZyBvGi/7NvVCyfZK7hfDTrUQRMDZ71URP/rC+vR0u5xk2PTSTgoIr2SbEps+hNXN/yPwiTqiuR0VBJijZnDKCB3paTBDIo5M8qxI8F8QF7P8Z/Tz9oEOTC1Cu4+0O4Il1CDJPAha6tDDf/BKtvxVSbO8ckulmm+uVvpw/2XhMqd3j/j455EQKhraZu47H2qNbEjl9D1g9eAPLtufN8AJO4bQ3LdgADa+cAA9kVhuQ74Hy6TwYMT+QFYjwUV52jEDwo1i7txVAZ8e2ZKh3y4Luz+oEVygZwYcOyqW00ysz8Wqn1ZpiDGf/S6qoKDTMvzmiPZe8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejogFBh0YipImsUvVvsj0BBL3H5nx6UPAUQzUcgKafQ=;
 b=p3h4JRXk19pKKfIAtUfAcHy+bIukqF/uBiO/Vo5nP2qjrF76pI7ITcJqQw6VqdluvU1GV6ZOgWyGi/5IsJbM3DNKAFOFZSnhK3pIRolhbEoIW0vxK737AFi/m0wYkWJSUJrNmq2yQ79jpK3T4FkhyMUuq8y7lrh5GRVAA/pQfNOHhmqjEHJV7Kl+ZQrSNT/5Bl3b9FQuuMN1YElZbfo53iJziUPamrYVI9T6PiMOpTAkDGvYW/2pzw1DDEi5zomHtFHH24kKLALBVdteCb+xVQ0cTnZhi23eDDKXO3Hay0F81TtB6sIT1lUHlVq0wVUlcEQrTzNW0sZXobFPWXLMCA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SAEPR12MB328447.namprd12.prod.outlook.com (2603:10b6:802:209::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 10:21:30 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 10:21:30 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 10 Nov 2026 19:20:57 +0900
Subject: [PATCH v3 08/13] gpu: nova-core: falcon: rename the local
 variables of dma_wr()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-r000-fw-v3-8-20d79ebb646f@nvidia.com>
References: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
In-Reply-To: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP301CA0079.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::15) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SAEPR12MB328447:EE_
X-MS-Office365-Filtering-Correlation-Id: c2b93cf0-ff80-4e66-9329-08df3f1462bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261026121527099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qzyYkqlSWzol09wqFGtVSHDeZGzDbgQ7ymLpX3yEzKbxK1EiVqlPA62YiCIePJqNtdGaiI3z8u0dp8iHWWE9ohUSaVw1szWePTtHxBVCh3F/JfntXAFXOAY9J8TLFdZxICaVp8mXMnGgGdg/1rztEFVaWf3KRCqNPSL31cymG085wXLsJB8Bd/yH56HgJgqO/3ITgFfaZqdR51Y9uG7pVLtE2/pkHueUcnBGWIWnZT2fCS9M0l1PWwO5sn4I+ReY8G5kkAT7d7pWgrOsJGH4G23EGcF53E7Uo8pAo9eA252jQ6igfw2bdovv7VgTQ/j/iZRuq+Lbf/rHI9ijR7Fa9U1vhUsX7oX4TMbFNErBPC/YeUluaMidNOigAhIoJhiFkEA4LhYXPFVi7/pL06MwpMQjCD/Z4jF7jSXctYXSNDIQajeqexRYbFpy9dPBNFEarjb3YSQEUAbl6Emq80vi0YUk4hqn2291DvHJMj8EEWyeLF5o8DiZwDoSjCPhASGla3jsj/dter/YVppaQpnul7K1J4+uXEVvfcFC/7HbjxZaL6S2lb2ktzodGgJ8xCLu8qk1wlX6Fwpq0RQWkjbJcJZx///K22PdnwT5FK30xGx+KL8ZEcc059f3gOtMpHj/Oa+RpkQRsEN89ecwuomPo23jt2HZbFRH+7aXNeFvb9o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RE1tdHJYMWdTSGtaVGhTSXNWbC9NUHhiaW44V1RSd1hGakNwcUk4N0FqWTQw?=
 =?utf-8?B?T3czMjV2LzBhYjVCOEloUWVlQWFyTW9xMERYcXdSVGFDUXdyendNWTRIYy95?=
 =?utf-8?B?bTZWOXN6RE9IbUw0MlJlTDYrTHFqdjd0UUpDZ2l1c29qZUY3elNXQWk3THhq?=
 =?utf-8?B?Rk14cEp0T1VHSkhoeGpuYUlnUjdnbnRPR3c1c0xrREVwb0RrK1UvOEVtRWh4?=
 =?utf-8?B?OEozeGQ1WnFObTBOaCsxeUgvSmpNVHJjVXExTnluczNESG16R1h3eGJOblR4?=
 =?utf-8?B?dHRxSGhxd3VzL0FDODQwbklxbFZGZStLdGsvV3F2UjBFazIxVDVJbDVqaGxn?=
 =?utf-8?B?VmtVOVl2S05GSlVxZGEzMlBhazJERlZaNlUvNzEvQlljc3FHdzc3Q0JhNHg0?=
 =?utf-8?B?ZERHRm9XTkp2ekV1TzhTa0UrTU9HWUdNNnFUMXpzYXlYS2piM01nNGdJSmtU?=
 =?utf-8?B?TWZ1aU5ucWtYZmhDbTFrekxKSmRtSEtOMUlVSlhCUHVHTjZjL3k5UldPTDRS?=
 =?utf-8?B?VmxDem9RbklVRDMvMmVwYnFOZ2gzVEdCY0VCaTlTOGJKUkNBTXV0OGdOMmQr?=
 =?utf-8?B?WXlYWWlGdy9WcGxhZFVtTmFUc1NrRlJhWTF4cmNpVXlmdVF1bHZqZDdxekUx?=
 =?utf-8?B?K2VHVHNWQTNDYnRkNXhRRDJuM1pFSzFIdHU1WTFvN1JxMUxnRnAzUDFGK0V1?=
 =?utf-8?B?a1ltM0E4Nld5R0M5MldtU2k1T1RRSXpWOXRvMkQxa21Scm96a29KVjJZWUpm?=
 =?utf-8?B?dnc5WmxZZXMyTzBqRHBUSXFGNVZ5V3BhekkrT1hWL1gyaEFsNFZ3UktQWGMv?=
 =?utf-8?B?RzZDRkJFNG16ZW9kY002VW5XdnphdEpYZEU2K1BQUjJQUTkydkdWemVMbGNw?=
 =?utf-8?B?Z0NVOVZqUmZmaTdQaXB2dWIycU5QZXVudWFESGdUeFJ4cUhrUndUSVExSUt5?=
 =?utf-8?B?ZDlLOVlaem5qRUdMK3UrSXhlWVdCSUFLY0NwbU5rQ0dUUnRTWWVwY3lzQXRz?=
 =?utf-8?B?SzNuWENoS01nU3FFUXNrbzN1M3dONXhQOFVsRHlVRnFYdHk0N1hIWXJwWkFw?=
 =?utf-8?B?Z2plcWgzenU2bmFjcDNGSGxpV2hndEhJU3NsNzcxQUc1L0tGdTdEaE5MSGNo?=
 =?utf-8?B?RXBMVVB1cEtTcTVMQkQ4U3YrZ2FPWmdXK05NVi95Zjh3S05lMlB3M2RWM25H?=
 =?utf-8?B?N0VCcGp3N0x0U3JkTmRvTG9vdXpzOFRHQlBZS2JmNm54cjRPb0ptbFh2Q0dO?=
 =?utf-8?B?OFp4aVhJREhkbUNFMWY3UjlpNHVTZEY2RENWRUJLWlMxTmlEVmllRmNxZEVG?=
 =?utf-8?B?WmE3OGU4SDAzS1B3UmFTQkRWc3hLekJ5TVYyc3hnY3N2VjBXYU44N2dIZUZr?=
 =?utf-8?B?UG9UZlBuSU9ZSzZGc0crOHhaR1BlclpDTlREbjJhc0Vkb3Q2QVlPWHZhQnNq?=
 =?utf-8?B?ZGF2RG1GcEdxSFlEMGRScUdDaDQwVEZrT1pkek94bWJmeGcvWkFXNlNHUlFM?=
 =?utf-8?B?NjFlTmxLbFJOd0pEYWs4OC9wTVVTa2F3alhZT0tuUUtrSDErdTZPRVZ3OHFj?=
 =?utf-8?B?aGNEakpuQkNHdXNtUUF0QzNicVF6eDEzcVdQUUkxakJ2TU5SK1l5UFdyVUUy?=
 =?utf-8?B?Yi9sdVM5ZmFhTnM2VlFBMWtuOUtaOHJ6aG90bkxRNi9Qd0dwWGNSdW92NE9K?=
 =?utf-8?B?YzM5RVc4UWEyb0lQL293dTlkN0VFTU85Q01WNlhTTU1uaFRmSk9MeVVBbmZa?=
 =?utf-8?B?RWF4Y3lDamF2Uy9NTXFoUXd5bEtYcjNkeTNiQk1PaXU2eE5nZy9YblF2SEQx?=
 =?utf-8?B?TFEzdnhpZGk5STFrNWV5ZTZYVWFRMjVvSzhSNklmaTlrWG9JK3ZrTEhleDFu?=
 =?utf-8?B?cVlXWnRnNXU2TlZyUTZSSW92cXo2bTFYZmxpQ1dTY3VoQ09YbDJzVVlWZ2VZ?=
 =?utf-8?B?ZFFBOWs5ZmhabUhpTDRra1YvQllBVGtiWnhNVVBKS0pxMVJTWncrTnRicTBy?=
 =?utf-8?B?cEJnQmh2dXdZZnVCVFZnN0gzY2NDV3lUUndJRXUxRTk3NlpScjVzOERNYldh?=
 =?utf-8?B?V0k4UTVWU0t1c1hsQmgzMUdZM2JaMGJTdmhsM1NWSzZPMDZXTFI0d24vKytU?=
 =?utf-8?B?b0RVSlBwTGRIcWRlRVg0eXNzTCt1dFU5elBXdk1tb0gzNXpGQ3U1Y0N6S3Ax?=
 =?utf-8?B?WGlSMVo3N005aGRwQld4Mm1tVXA4QVJYMStjRlpDOVc2Vmtlek1weXV2Qlcw?=
 =?utf-8?B?cmN4ejN6ZHlZUHNzWVoydFhpa2ppb0hrS0RNVmJvd0RYdkN4RXRkbjBsM2NU?=
 =?utf-8?B?WUxDZ2NyZTVDbGF4dVBJR2JpZ3QxSytMYVlMalIxYUMza2xRU2pXQTh5dk12?=
 =?utf-8?Q?Bb3+D6NzmGBRNEDKMvqYbgUIY7nar8UhypWx81fQP1Cws?=
X-MS-Exchange-AntiSpam-MessageData-1: PFpGt6egM9JvFg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b93cf0-ff80-4e66-9329-08df3f1462bf
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:21:29.9574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pEOpkQ5llBOMgvW+sS85RYP55tnOk2bDEIjCl40uc9IOVvBTK+yb68pMr/Vm8Q8TQqFYccnwqjcIzRQNd7lRgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR12MB328447

The local variables of dma_wr() are named after a generic DMA address,
while what they hold are the values programmed into specific registers.
Worse, the `src_start` local has the same name as the `src_start` field
of `FalconDmaLoadTarget`, but a different value for DMEM transfers.

Rename them after the registers they end up in:

- `dma_address` -> `dma_base`, programmed into DMATRFBASE,
- `src_start` -> `fb_offset`, programmed into DMATRFFBOFFS,
- `dma_start` -> `base_offset`, the part of the source offset that is
  folded into the DMA base.
- `dma_end` -> `end_offset`.

No functional change.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index c888f29f34ce..299f17b1218a 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -562,24 +562,24 @@ fn dma_wr(
         // For IMEM, we want to use the start offset as a virtual address tag for each page, since
         // code addresses in the firmware (and the boot vector) are virtual.
         //
-        // For DMEM, the start offset is folded into the DMA address.
-        let (src_start, dma_start) = match target_mem {
+        // For DMEM, the start offset is folded into the DMA base.
+        let (fb_offset, base_offset) = match target_mem {
             FalconMem::ImemSecure | FalconMem::ImemNonSecure => (load_offsets.src_start, 0),
             FalconMem::Dmem => (0, usize::from_safe_cast(load_offsets.src_start)),
         };
 
-        let dma_address = {
+        let dma_base = {
             // Upper limit of transfer is `(num_transfers * DMA_LEN) + load_offsets.src_start`.
-            let dma_end = num_transfers
+            let end_offset = num_transfers
                 .checked_mul(DMA_LEN)
                 .and_then(|size| size.checked_add(load_offsets.src_start))
                 .map(usize::from_safe_cast)
                 .ok_or(EOVERFLOW)?;
 
-            io_project!(dma_obj, [try: dma_start..dma_end]).dma_address()
+            io_project!(dma_obj, [try: base_offset..end_offset]).dma_address()
         };
 
-        if dma_address % DmaAddress::from(DMA_LEN) > 0 {
+        if dma_base % DmaAddress::from(DMA_LEN) > 0 {
             dev_err!(
                 self.dev,
                 "DMA transfer start addresses must be a multiple of {}\n",
@@ -594,10 +594,10 @@ fn dma_wr(
             .write_reg(regs::NV_PFALCON_FALCON_DMATRFBASE::zeroed().with_base(
                 // CAST: `as u32` is used on purpose since we do want to strip the upper bits,
                 // which will be written to `NV_PFALCON_FALCON_DMATRFBASE1`.
-                (dma_address >> 8) as u32,
+                (dma_base >> 8) as u32,
             ));
         self.pfalcon.write_reg(
-            regs::NV_PFALCON_FALCON_DMATRFBASE1::zeroed().try_with_base(dma_address >> 40)?,
+            regs::NV_PFALCON_FALCON_DMATRFBASE1::zeroed().try_with_base(dma_base >> 40)?,
         );
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::zeroed()
@@ -611,7 +611,7 @@ fn dma_wr(
                     .try_with_offs(load_offsets.dst_start + pos)?,
             );
             self.pfalcon.write_reg(
-                regs::NV_PFALCON_FALCON_DMATRFFBOFFS::zeroed().with_offs(src_start + pos),
+                regs::NV_PFALCON_FALCON_DMATRFFBOFFS::zeroed().with_offs(fb_offset + pos),
             );
 
             self.pfalcon.write_reg(cmd);

-- 
2.56.0

