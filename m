Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012001.outbound.protection.outlook.com [52.101.53.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647091990C7
	for <nova-gpu@lists.linux.dev>; Sat, 25 Jul 2026 13:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784986215; cv=fail; b=Yf8SgUPI3Ya1aAv66HdNLIv/SfbPsRktPj9Px4lU6XfRrhU0pN8GQ5YQFZc1cfhMxJ074hRf5E31f33VuYbi1h3CptxsG5fdiKwmApwDm4OG3bdTGHleg72JX4jYf8gJdV8R2mN3z2yf1FhBf8wcYucNxs1Y9yWnRs2Mr8K7qZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784986215; c=relaxed/simple;
	bh=yOs2S0IosU1JS32CLREiENYRruDFdc/561e0MianBGI=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=OVy6MrOGKRC8bt906uZqMqSkN8wyqRIhQAPGNlNSR18DNtUzqjvsIhTvOUjJeJmYLluoyp50ZeHXw/pKgMLWPItbQfJ2SzqyonKjuNJ/P8pb50VEDUvPlSvGAqCtJHK+3VskWFGqOOtBbPjhl7wKjUV03Zt4NL4QBSj00SKoiN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pbegi7Qi; arc=fail smtp.client-ip=52.101.53.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pbegi7Qi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqGf3Chp97LehnQd3Z2tatJFxn7/BINg3O7mf9OsstqxEJxqbqWXdxjRC+jM3L07OLHQPExzqYATeDf48PPki+7jCZlyGUY2j4hLxuAtJUjUKmhnKECFR4LGEkVPCEPo4JG+OXB38tKrfy7V64xymT5Mi7juR6NM4wEDbhEXtsnLf7J1EAZ42BjEbbljemKIgYJl8eux4GfKQEGRy/3I5df1tPerUMXH4AIFDO8FbkLGQAhs6OPQM5Qs8bMa9a29xvlDRqlmRDFTwa1SLEtbaQ/5/7ISUWBheePnutxDfj4Ou+RNsLLZU/xlEZe3q3LtRZUX1E57o8HV+d/+KPjG7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOs2S0IosU1JS32CLREiENYRruDFdc/561e0MianBGI=;
 b=bygylJ1HX74ey3qStAKcdw8dg5kcOk0/ModJ+u0+xkvgNBxiDfBrFt8z+beXDzDAjGRBCtwcNyvd/pwbOv/ozmORaaKs7uvGk6cXGJb/4O3JFPFL81oOuiKOscALI+6K59X4CBjI9rl254/K+AFY1/dbAcd+FmQ8IDTwzSwo3/M8e5gXO+i5NYn+kuqog+7FG4fTIugZl8u+cgMAp1fhasqa4o6wnLxiZJsmlBVrjYK8kYulRGdToJ+rNVjmscLmvEPmo8r/FkNQr8goHzA+q39r7IHZ+jS2E0C+mLoAfN3nysNUS0ivkznMgVHo2XyqNeBWHLS685U5PT/qOORy5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOs2S0IosU1JS32CLREiENYRruDFdc/561e0MianBGI=;
 b=pbegi7QirA0n3ZFTfP37ILeS2hnv1SlHP+dgQh4eprRTu0XRxQUuFTIZZebI2vrg7eN+dT8RlNgajSxD2IWBB007BgFnGAfWvoglRE7o+ZeYfjVRxcvGDc9vWAiYdRvoocooo/zmclOpWUBe6ZYIu643FeG1I5m/t8PISUg4h6vAF00oymb7HJF9oVJy/o7dQsD4rUHo8ytw5jzdfRPmwRhtiGHpuPnWfRiOGwIeZGqc0ErDWjVX6LTVDLjboZcOcc2NkNaGVbPOWJQoUOtUikscG85nWjFrG94qDiBODFgGkA3ASao4kDRgzEfv/ytkX3t6aUu5xUkd+LVys9l6FQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7876.namprd12.prod.outlook.com (2603:10b6:8:148::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Sat, 25 Jul
 2026 13:30:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 13:30:08 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Jul 2026 22:30:04 +0900
Message-Id: <DK7OSU65CUI5.SUHYN2WORHIP@nvidia.com>
Subject: Re: [PATCH 3/3] gpu: nova-core: Move one PBUS register definition
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Antonin Malzieu Ridolfi via B4 Relay"
 <devnull+dev.nanonej.com@kernel.org>
Cc: <dev@nanonej.com>, "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <daniel.almeida@collabora.com>
Content-Transfer-Encoding: quoted-printable
References: <20260721-nova-core-regs-split-v1-0-384fa2a42244@nanonej.com>
 <20260721-nova-core-regs-split-v1-3-384fa2a42244@nanonej.com>
In-Reply-To: <20260721-nova-core-regs-split-v1-3-384fa2a42244@nanonej.com>
X-ClientProxiedBy: TY4P301CA0077.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7876:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f8b27f9-9690-4386-7a90-08deea50d875
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|10070799003|7416014|1800799024|6133799003|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8ORPdgbqR8kpnKrBK9QYFxiRiN5Scr8yuAUUCEsDL4EoXJYWsPEbhrkmQCCZ68DCHWC8n7CL6A4tcnPwLTVDarZfCo8T7K/K4/oB4LdQ5glQqk0RAkZvcvKLxN1XfcRYnB5sJJ6d0BILo97NXxBpJr7C1Ezyr9jJ4c1t5lNVe6dInvObIfFjWExhic5NaBQ2YDipmTOgVoq6BoOpTFP2qI0D+nuxGoC0xE6EBJudLTX6ljGjToJGjTkkZtiFOc284Lf99+U4vTlNbv2NcBO7XgXMyeG1Q00yP8giAGwvGqI2x3RGFgYtBADfvu5jpc+quH0cWk0TAmVhiGXFIt9+B/WmlDwUGSl/rCjjQ3HBVe0ijAzuyXpKvb8fchGrPxZmkAQ3SxLjG6VK+9J+07PLsg5ayPJ/mFGIVq1zd+S1/1R4s+vmSW08yagPcNxKF5daZrZgcVsq7lnINoHhRZP0xwbuuIUnG7KuJrVSFA7BOJ4uH4kFVUE1lImWysRQryL8KwTyJmT08X+Y48v3NoGDLWylY25vHznncIY8nikKXSfjA3MmpD0PTIjnDJWqsPacREl/Yy8D+QBokeGbD8NFK5ydjKhOAEMmklsmBr+mdPN7o6PI2w0S78jDbMdRfPGuxBjKY4jTp4WN466dG9k1FVpW/Khzltfk6Gg5LR5OkNw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(10070799003)(7416014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE9wRmRqU09TaW5WWVEyT3NSS1Y4emtJZ2Y1STFTTnp0d1cwblh1QWJ6VDVM?=
 =?utf-8?B?WFlucS93RUY2Mmk2THhnV0dVT01ScmgyaFlSQTVZdjhSVFMzODdvVXhiNWo5?=
 =?utf-8?B?NnN2UG56NkZod3FRSTVkTkJTWVpValU1eTJUWnV6dVJhczRHekQyVmNvelpS?=
 =?utf-8?B?bUZxSzcrUmhxVldEUURTS3ZJblhWMkpWYmV2bjBaV3FCck5UNTA2THpZT2l6?=
 =?utf-8?B?TjZLSGJzRzVyN0FmZ3lxSEJ5NTk3MWxRYXhLUURab3hITFhDbytoVC9La2xn?=
 =?utf-8?B?YUpqSTY4dmE1OUpmMjVHS2duWkg0bWNWUml6NlJIelcwbkRtR0REaGdPMkg3?=
 =?utf-8?B?Z2NncGxkYWc4eTRZOHBTVkhkYmVqblhDN2sxSG51TVFaVjlqb2RJK0Y5NzJQ?=
 =?utf-8?B?VGxIN1Y1MzN3alFXMVJtQlBRampReldOUUhuMC9iUlhPd1pKbDE0bGYySVI5?=
 =?utf-8?B?NVh4NXBOVDVLTk1qR0UwdW11d2dSMkxOWnlodmsycVBGOE1UM25GVlg2eVZS?=
 =?utf-8?B?aGdXWkdudWIxZUs4YXhXcTBHNkNGUDVBMUdScU1Cd05adWIxMHlsaFloVjRQ?=
 =?utf-8?B?MUdoMXplWW9yeU9ONkRHL1hyTzE1QXA4WUZGcU83WFNUWFNWRkNDQlZiSDJR?=
 =?utf-8?B?azF5eWZrOVMyQUVaVUxQUE5Kb2dRY2ovY3gvTVIzc0F0cGttMUo2Y0poc3hw?=
 =?utf-8?B?Ynl2LzBZS1BNQVc2b3BXSTlyVW52UVllM3M2RXlYczE5dHBGU3N1MEJEbzhp?=
 =?utf-8?B?YWgyeU5TTGJmMjcvRjVyZHpQejZaL0pwVXdKSjRmNTdoSENjaEMwOFl5dTlx?=
 =?utf-8?B?UUpiYWNZOEhvU3lsSkFUQU5aT2hINEJGb095VjN6eGFuWjVxdTBmamhYR1RZ?=
 =?utf-8?B?ZDM5UEpPT3pOQldvYXJONURlR1NLSFJua2g5QTFKaXBqNjhKV2gyN3AvcitO?=
 =?utf-8?B?dmJtNEoyV3pJZXJXbVZmTjJocy9pRkZQVlZKK29vdnpyNnNrNDZINXlnTEs3?=
 =?utf-8?B?NWdDeUFXaklNNUtZams2NlRnbHVVL0pSNXBsVm9LdGVDMWQvZXNscWxmSmtt?=
 =?utf-8?B?am83eW5XTm1vTjdPZFV1VCt2cDlGbEc2cTNaMEV2VGxPbVZOZDl6L3hyQUhy?=
 =?utf-8?B?SDJVUW1pblYyenY3R1ByNDAzbjdyUGZIcXpZbWRjaTg1aS9vamtOS0U5Rk0x?=
 =?utf-8?B?SG42aFRxcGpoZVlLUVZMMDJFRmpGZzdxaDJmRTdYS3MycjhWRWQ2b0hqTFp1?=
 =?utf-8?B?R1lQYzU0K1ZtWENTSVhhK3c2bFFuS2lJdzZVVHlTdDFLR1hpS1RSWG94Ritj?=
 =?utf-8?B?SGdiOW1kaTNlM2I2RmgxRmhjTlNGNlJkaWhjYzU2SXl3REwzVkhjYm5HWEFV?=
 =?utf-8?B?U0RUM3JvSzluN0NoZjdtc2daYitUVTlwRUlnelBLVE04TFJGWlVhVnluc0Qz?=
 =?utf-8?B?R0haQUJNdHdKQVQ4dXorOFdHSW9mOTQzbXkrOERvZTJDQTF2dmwwNnZXNEdZ?=
 =?utf-8?B?YjNQTXFBdGtCTHhhK0JKMUQzZkhvUnUxUG1SNldyWlFTVURGb0UxVGJkQzVV?=
 =?utf-8?B?aHJQMEVRRENtbjFUcUxYd0dNbURWZGxwTEdrd0NnWVNsT3hJQWtORURWbHl6?=
 =?utf-8?B?NWcrYkFpZHRzTGNtMU1ZU3I4L1VNZ2Qra1UrcCtESnhGeUdCNGZPYWFpSFZk?=
 =?utf-8?B?NmpLYjFCZG9KSlZvbmRyQjhRaW45K25jVVhrY2hNUWdFbm1nWmdoSFlHblZS?=
 =?utf-8?B?RmNDUEJqRURXU0YwOWozSTUxNG5STnJDZzQzV0gzcFdhZ2R1TzZpcXR1OXhB?=
 =?utf-8?B?QTZpd3lBRGp2clIrTkg0TXlJalFSaEtBNDI3MDRnWVpBaDFPclJINmR1MXVn?=
 =?utf-8?B?VEsvaEZxNEp2TzhKMUhXUDBSMUs5SkNwQldKaFhtdzlDZVlSZUZKaldFVlZ2?=
 =?utf-8?B?UVp3SS9iOUZWbVBxOGRMZUFRT2RWbm5kTlo0aEJXa0dnUWlaNVFpVG9Nc05E?=
 =?utf-8?B?NmZiZkVWK0pYL2NEck4xdXF1b1BodG1YSWl6dHpva21PWGVrSzBCMWhsbDht?=
 =?utf-8?B?aTFxdkd3MGxXSE5tNzB2U3pRRk1IMGlPaTdndFArRmE4cyt4UUNkNjAxMWRh?=
 =?utf-8?B?bk8vZ0pYNzd2L2RsSStuVE5PaUFITCtUYU9oRkJyNGdFekhQZnArdlBzcXdn?=
 =?utf-8?B?QllNQllyVjZ6eWNtenJSY1hqaWo5ZkxqcXh2Q0tGUU9WR3YyWkxxM0ZkMGRR?=
 =?utf-8?B?R1o4Tis2cTQyM2xsUHc1djg0eFZMOWhPa2Z5em80ZDFNdkUvczIySU1yVm1C?=
 =?utf-8?B?MmtOOWJNekhZYzVhMnN4OUhJeFpzRzB6WENlMnk4dTA0SjhsSTBOWFZXUXJk?=
 =?utf-8?Q?LL3MxXfoNOJkwsfgQ488OCH2y3vAOwifMwxlvsA21qWjL?=
X-MS-Exchange-AntiSpam-MessageData-1: GKQXyD7YiCyLOQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8b27f9-9690-4386-7a90-08deea50d875
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 13:30:08.5278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ysKEJZUJZ7BRczLWP8fkuWjYFdQ/0li1W2HUx1tCwCpWEyHheX3oE6aLVAUJrJwd5piFWsB1ZndL/xlgc2Hehw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7876

On Wed Jul 22, 2026 at 12:41 AM JST, Antonin Malzieu Ridolfi via B4 Relay w=
rote:
> From: Antonin Malzieu Ridolfi <dev@nanonej.com>
>

Same as patch 2, we need a commit message here.
