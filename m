Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012032.outbound.protection.outlook.com [52.101.43.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FFE2D8DD0
	for <nova-gpu@lists.linux.dev>; Wed, 17 Jun 2026 03:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781666026; cv=fail; b=d0rnmUi/ne2Et0U2EwKcgcqdTTZQV4XZmT+s9+oLG62LmpWvOzcVXLX+JYZ4ANeRaTIPiE0A8V/uNkSq/A92irXDxHYv8dRn01iQcXQrTnc9RR3IYcpMkmWvNoTEfQ5erMpEnO9sE179RC0L3WkJ/fB2WUHBtCJgtIzh9YBRXlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781666026; c=relaxed/simple;
	bh=ABxxa7BBirDKw9sjgsgAwisJznD/UC+HYKPN7s32muA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=W7PmPDoxHRJRQnki3ylZL9UWSV60bZ/mQMalt92+rwFjqsxKvpe9kb+KcTnUENnq3fInEQdO/knXZBFJ/STDCGvgg7zvECJELnntd1cIROzLEHOUYgfVyfX7ljtO5Nmlt8SQyyOUhbw/TLu2BdBDFsFiULO1A+3cG+N10lp806E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YewcIGsY; arc=fail smtp.client-ip=52.101.43.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YewcIGsY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lC4Y7TXlvY8Gl5Y0ifKj1QYC6yd7ytTTMRb5HBAuxSqXT25w4uhBCe269KDhXvMPGx3/u4Y29N4iwWFSRlg6rS7IesRR104+tN7ZUBGa8XY5BiqlWTtfFnPfaTi1TScM24+ei5mhWtDZF25B0EW7hgbfnkYiH6jd4mCiHUeoGK09B3kaNzVzXFKcfG+TUX5lm/N/msczzSzkaF2izDvV69nb3s9szqodWnaPK9jWLWp+DazNxGP1OyIlcrN7AjqaVWEkKwzrG4JamNblRwxJukG6EZl+DnBmo7M5l40ZIamMuATPqkfUMtcw3twcA+4KXRbuSAVGNZCF583cKyU+Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTWaIoM80juoe/TvBUw+3OfP7EEAPr06t77jdeofq4c=;
 b=l1Ky6/WUq7kU+hfYeTEDqbOWpvVfJ+E3xACoYmWFCqSNpeD/ZkA7LpgC4Es72yIBk/TJw+D9P16/NLmmEfz8PlD1jR5nddU7WEugmLkftQH75lcy9rjl/6C8ppBPR+D4YsB8zsc9dsi+FT5sV2kzdyvwL1qjLjLyfuRaX8qgKRv7xO3AJmf40KRJVvKmJTHIIb+KMABjA2f3qEHoL1J0FHkU3RufenOGxht1Pi7By+AMiPaqui8QkUSUL8yfQomLcwRGFR70WrHCPp+GVjtEJvIgS2iZahXUnBKiw6H39mDRdMad+YnWQuTgb2xhA8N1gKY9XGAd8JashHXNp23h9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTWaIoM80juoe/TvBUw+3OfP7EEAPr06t77jdeofq4c=;
 b=YewcIGsYd4EmotsKxZIzJgDtP1ALawy4aJIpK0/xWFl8otngskMtQzp5EgL4N+7nSvCsDX3jxhF3ztV80N3BPYvgSyP2QUHUdBt687c2y2DGeS6nkgc2j5RsvXLrXtheUEkBW4x2EBmwM/dyZ1KIjBjLcV45r6a+uOWtV9hc9tZ0r8Hbj2hYeqn7ujr/LosIQe8LBkawWCCAkc1rTg5uYcOj83UtmOgEm3OdYw1VSWk9XbddsDlq1GRfjayszdZ7fZpuw2VAsTmUguK0iNBnrSv4ypZDu8RdMSpmXsfAZHnkRVUriaWilFtsRxzgon22z12jHrOJT3g8FCUrmppdsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9251.namprd12.prod.outlook.com (2603:10b6:610:1bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 03:13:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 03:13:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 12:13:36 +0900
Message-Id: <DJAZW4IHXQIG.325CXIBVGU6FX@nvidia.com>
Cc: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <jhubbard@nvidia.com>, <ecourtney@nvidia.com>, <joelagnelf@nvidia.com>,
 <apopple@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <kjaju@nvidia.com>, <alkumar@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <zhiwang@kernel.org>
Subject: Re: [PATCH 8/9] gpu: nova-core: set RMSetSriovMode when NVIDIA vGPU
 is enabled
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
References: <20260604114339.1565660-1-zhiw@nvidia.com>
 <20260604114339.1565660-9-zhiw@nvidia.com>
In-Reply-To: <20260604114339.1565660-9-zhiw@nvidia.com>
X-ClientProxiedBy: TYCP301CA0014.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9251:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bd9a0d4-2454-4609-97dc-08decc1e6dcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|7416014|23010399003|22082099003|18002099003|4143699003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	jNqfC5Lz/bxjf0e0LOzFa2kiHS7IWy8Xqcm/a0g52DfPWm+H3UWLYQ9P4qtZzJoqw2z9W3RQPOQFc/sTt7Pnan3+0ExgwkQ7TBKoSk6oFgN1bw0QhQA21Xl/SztNy6mTzVtuxH9Df1rFuGN3ZxeT1Lfs7WGrmStCh121nyerCms3/lIcpL7CZuZbfjir5YwamRDD7lWDxMN8TDChd9qKjjTFSh8krfGhQj/s+UdVjXa93NikcglPhzcjXop+3ETVILKMpH+eKCBueaP7njkz+g27USmdCpIldeSFRFCsPIOurT6R1BjEcOfYxnYrIsC8VcdCE8R9fIlIPmdpYo2fBzhOI9rt0y+JDpk88ePO5m+ckHNqVlXQK4+TLa4JCRqxggi+ABf26iTUeHmM9QrzCeJE0Rr+nkWcxQpMYFNN8Nl+TBQXXFVXPltD29N40u1Gshil4tGkmyTFFi9QJDjb54aAfLOgyKZaVrkz+gLxwy7pO75L3tvjyXnwv9CC0G8RE3RxQgwXhuuIyGeHg2M9yQGPyRe4YfCEqMNXCzxhDCOIx3phI2fijFrtnC841JU7f+R1It6o3f8oOv5lyg11RCgPvtlV4fluOExd9WsQh7dKGmHgHu0EwDABV5Hq8LNz6bKAmklzZ/cUieDcA44T2ogNydeSlBWS4p0eM/c9E2qH2KA9p+ZZvE2YGZFRztI3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(7416014)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEo1NGtuSWg1QlF5ZUo3QjBERFVuK3ZTWEhxWmp0WE5nRU0yekt5N2QrUjZa?=
 =?utf-8?B?NjdTM0h1cFNuUTZqOUxwRGR4QWRDZzR1c1BpMldjTGhIUE5PalVrdEU5SGtB?=
 =?utf-8?B?Tmhxc3A2SStWdXhOaU9Ya0RtVUF1VzRhL3o0UFA5d2haU0hQVk9NbldXY09Z?=
 =?utf-8?B?VzJnQnBFSVpmUTZiQTV5TnhZTFZVaXFDYjhtczJmSW9CREx0a1FRUEZRb0dl?=
 =?utf-8?B?ZTFDQk5SN2s2bi8xVVFucmw3MVN0VUs4T1lHS005U3ZuT1Y5WGUxL0J3VlQ5?=
 =?utf-8?B?K29MQmQ2NGhYZEhrYTFFQmEvc2FNY053amRoUzZQUE5ObHk2b0d4cVczUWJ5?=
 =?utf-8?B?NkM1eFhxekErY0tMSENQMGJJL1d6Z2MvOHdpWFRoR2JvSWR3UzZHSzVKT1Zq?=
 =?utf-8?B?R01aMEpuTTl6MVBqc2NobGpGNXVQYzRZUW9zU0FWbVF4RkY2cTc3Y2MvY0VM?=
 =?utf-8?B?ekFRRGU4U0UyVEVqTHBnZ3lQWnFSSGwwUm1NQys5MWFMYmNHKzkrMWNtUlZr?=
 =?utf-8?B?SW9FZlBXZXVUVkVPZlhacFMvMloyQlZTVVZSM2orTkFjR0YzK0dJOFltbXN5?=
 =?utf-8?B?S0hSQUxnNk9YUUlQVlFFQTFyQlhNRUtjR1FIOWRIS0YybzR3VHMwdVNva2o1?=
 =?utf-8?B?anRZclNKRW5VeCt2R2NzMFFWeGJxV2dSUkxrZ3IvTmQ1SlZqR1hWS3NkK0xL?=
 =?utf-8?B?WVNQaWM0OTZXZGhQbUd1Mm5hemdBU1E2L3JSYkFZUUxEL0wyT0NqRkJKV2pB?=
 =?utf-8?B?USs1amxLMW84ekNrTUtzRFNIVHd2UmN3TDhlV1VnWGYrcDcrWEx5QXJLQ0pE?=
 =?utf-8?B?SzdWL3ZSeG1SWjczZUhpanl6Q1c4K1Y4UFhZYzhtQmFwU3NrUUxEOFF5Qzhj?=
 =?utf-8?B?aitXa2Z5ZXF0V1IvdGd3RlB6b0poTVJhSS9ubll2RlByejJnZGFIN1hQeUJE?=
 =?utf-8?B?aWVQUTZENDZUbVRVam01aHRzZUhZUkZtVG8reGlmWVpvOGZuZnFYTWxIZFV0?=
 =?utf-8?B?a05vVmJUTVRHM2F3MElCUHlCNS9OaFkvS2tGSXZCY0VQZVVWcVM1T2ZRYlRq?=
 =?utf-8?B?bU4xMEFlajJUTlFMKzJISzhUR0JkOTkzYUU0K0Z1L1JaNHd6WXowSXdlQ1lx?=
 =?utf-8?B?NHRLblN1dWtMU2FLSXpGNUhHZno3NWRKY24wanJ1UXRwQjBra1RMMU1UZTJk?=
 =?utf-8?B?dDFEZ3NZaWtPcVZncmU2a2R3cDRJWTkrT3ZwSmlIUktFZDBsVnBMRWpnYm9H?=
 =?utf-8?B?TVo5K0xWTXFjUXcvRENoaUN2U2psd2x4Z0Z6eVRvWnZzN3VNUVF2c3R5MUtK?=
 =?utf-8?B?UnhYUzVHdUNPbHJMeHZvOEcvUUV6Zk5uL3VSbytOWEZxMzNOUXhJcGdtVEJH?=
 =?utf-8?B?Z24xTi8xWXcwMjFHaFNUYzdzcXBxR3lHem9PTHpQdU0vMnJPK2xqbVZ0cUwr?=
 =?utf-8?B?WDBJRFZHWnNSUDBHcUtCWUE1L1UxZHh4bmtqVGlyWWVQVlpIMnpLQ3Fjd0Er?=
 =?utf-8?B?dDc1M2RKVUU4QzhmbndzZmtDbkJJYjZ0ZHEvUFowdHJmNWtiT2JOL0Z4R3JT?=
 =?utf-8?B?VTduWjdnaFFkclhUYzNabTFqcVpuOVhwbTA0WExVVzRTYlcyVW55SkRIbkpH?=
 =?utf-8?B?YWF6NVNpeS9mSVFkdmh4UUNzR1VNYnNkRUx1S0xKb0RkZ3dMaVJXZjB2dUpo?=
 =?utf-8?B?RFRWTnF1cW14K1hoTEFRUXprY0huWDl3UjdOekppVVBubVh1QjlsdUxMMDZa?=
 =?utf-8?B?L0VyVEJqQmtVSGFSeDk4V2g2MXA5Q2ZHc21UZ3RyOVUyZERMSVoyb3JjVlBT?=
 =?utf-8?B?d3ZxbHJpWE1oL3dLQWpMWjZUd1c1UThrSThVZ1RUQVJWbDV1bmc4S2loNEV4?=
 =?utf-8?B?OHdwcFBmSWFtU25uZEU0Vk9aWTR0dmw3QjlrSzMwcUQybjFiOWdUTUFMTEtL?=
 =?utf-8?B?enJROU9rVG1lTnFza1hFUU1yMWk3dkNaSExJbnF3dnEzRTM1MlpWWUhEcjRs?=
 =?utf-8?B?bWp4Y2w0QlBCSmVDTVo1T2R3M2lucFcvTTRCamZrSXpNR2Z4d2FsWkwwR2cx?=
 =?utf-8?B?VFhGaVdQamZMUFR3VjBNRDBIV29xWE5DcUZ3YitaNnhOdjc0MStCdFIyYTNi?=
 =?utf-8?B?VGNOYTF6ejNyOE1kUFhJeHlPVForNVB4eHRoUFpDSDRURlNPM2xhMFBEaFV2?=
 =?utf-8?B?R1lsd0F3WWdaR1FkUkZOeW1sMiszV0RRdzMwa0M0NUZ1dkpPVGJDTUFGRFpX?=
 =?utf-8?B?OEx2ZU5vU3JsV2F2WmZRUlQ0Zm9ZdzRWaWQ5dzI5VlNjT25ENDQvZ0ZPYkVG?=
 =?utf-8?B?R1VrYjBFRklVNzV0djM2bVFuS3E3RlZKWGdmV2RlTCsrRHVoMytLR2FxeFNr?=
 =?utf-8?Q?W6BeDMP4zaCl14d5+/tZQ6PX6KEZZ6CXbZQwM5R409PXw?=
X-MS-Exchange-AntiSpam-MessageData-1: QOU280IakXRdrw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd9a0d4-2454-4609-97dc-08decc1e6dcd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 03:13:40.1807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +THSUp6pIvOb4QKMap0xkLPxelg4/EKzGRiMZScOl9eNybecfDjvLyl5Z31fVHN+jTsp+nWEVWlb2jLcqcUpfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9251

On Thu Jun 4, 2026 at 8:43 PM JST, Zhi Wang wrote:
> The registry object "RMSetSriovMode" is required to be set when vGPU is
> enabled.
>
> Convert SetRegistry to use KVec<RegistryEntry> for dynamic construction,
> allowing entries to be added conditionally at runtime.
>
> Set "RMSetSriovMode" to 1 when nova-core is loading the GSP firmware and
> initialize the GSP registry objects, if vGPU is enabled.
>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>

Can you split the conversion to `KVec` and the addition of
`RMSetSriovMode` into two separate patches? The conversion to `KVec`
will likely be useful on its own, and splitting also makes review easier
as the concerns are well-separated.

<...>
> @@ -299,6 +299,7 @@ pub(crate) enum MsgFunction {
>      OsErrorLog =3D bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG,
>      PostEvent =3D bindings::NV_VGPU_MSG_EVENT_POST_EVENT,
>      RcTriggered =3D bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED,
> +    GpuacctPerfmonUtilSamples =3D bindings::NV_VGPU_MSG_EVENT_GPUACCT_PE=
RFMON_UTIL_SAMPLES,
>      UcodeLibOsPrint =3D bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
>  }
> =20
> @@ -348,6 +349,9 @@ fn try_from(value: u32) -> Result<MsgFunction> {
>              bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG =3D> Ok(MsgFunction=
::OsErrorLog),
>              bindings::NV_VGPU_MSG_EVENT_POST_EVENT =3D> Ok(MsgFunction::=
PostEvent),
>              bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED =3D> Ok(MsgFunction=
::RcTriggered),
> +            bindings::NV_VGPU_MSG_EVENT_GPUACCT_PERFMON_UTIL_SAMPLES =3D=
> {
> +                Ok(MsgFunction::GpuacctPerfmonUtilSamples)
> +            }

Why is this needed?
