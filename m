Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021102.outbound.protection.outlook.com [52.101.95.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E3B332629
	for <nova-gpu@lists.linux.dev>; Sat,  5 Sep 2026 14:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788618337; cv=fail; b=kLszFgqCoG6aITpeK4HarIBgBfQjJGCCL5IjYYvHPg32Kpsbs54kh9wUFMqKjLlnU1rY0/b+/h5jDgcdatyY5zNzhrPhrYJ/NbgI6l8JBJ0uJO6kgx+69t/AS8f6Gaqo/ukhdiebb7jQlyiKn/gKw5LPmMI8vtVINVjpY6UQOvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788618337; c=relaxed/simple;
	bh=4F7ejrN4CSMEmWaH4GKar/yLFZXlP2ysUoCQ8gwb6ZQ=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=UInw8zNs6CzPxmOfTQU5EE7dIbewQdIWMSUvMea7pvF/mS5WWAYkxifyeu83eINmQVSPGethh+qFceBNY6g7O7bTspdFLO7AMjSsadRCTOD2+sdiNUzlLzL5hS88VWEzQBTgCYUIcDbFob99jJNjnnF+vuxJby6dkUUoDw6AWUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=FtZIcVAB; arc=fail smtp.client-ip=52.101.95.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="FtZIcVAB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGHS1yq+V3d3paQ1uaFC1qiLdAAV4zZTgkbOM7yos2uLuSqdRnbR+xBtQ0kb7DtJtGTNT5vLuM4bft/POo4KDPnIgEKCpfr9DQ3A5ekoBFZhBC1t82EJ+s8NS5SQbUO3m7FwGBJBLr/3twv4AJX2eO6fi9+DZTxr/QbSovE3ciN7BLgRthOp6gE7K0b4iDPJhXNdDyqK6AvucrZqZ1D65SCmgVx0DMxjU9bw0EuP5yECF7FglK0jbMYCMEFHNVf/tnMSYvOG8C3+OZk0YVgiNottgUf+EtagZ/GCL1tTFlbnmLyplfR4cmt/ZoSQfoD5M+aq+b/GoT6A8AW6EK8k8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DTq0XtbQf2/qV3KWMNnD2ePhVgnRR9D+69SXfiww28=;
 b=WOY5W2Hp8zwTXr9/+saOE6gil8Je7xnWWnZkk5Mj9h6WZ0arqhE0QsCnvR+qD3UD6LLZdlQTlBCIDkncj1Nsr1jpgDUe6K79dFKo6e+AnExAMMXrQdvyEv1eq8oM9F61spqu3Jj7WUvExcNG/kyc8UmVvdPwdP1re56vvmmbnRYF33qPhGOxuPGzYPIx8PPbkNvMSgUsC2Nb5SqnOgozm9++b/vTexuq79d8UztDpU+CLh3Fpuf0Ne9+0lgsW0X4J6T91rT2XStHfEHegDOK6DfoZgHQiGWTaxmzqpTDvxNWOOAkmila0FhjKHDdJbCGG61VU8T+D5zyaxLsWTIu/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DTq0XtbQf2/qV3KWMNnD2ePhVgnRR9D+69SXfiww28=;
 b=FtZIcVABe1yQ3Khq0e6jS1/G24XlwxWKNGZSAN64YfrJ0oLBaYdxHZOu3w3eu0cWkMVNdTLmxwK1lHTfF4MEkMvvnUchAR3YbgNRUsEQt8z4ZbHr+dxaeJVYpiP9g2tmNnPfcUHAuQF1VW99u7U+xK/UViorJ58YKcttaPHMG+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO9P265MB7587.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Sat, 5 Sep
 2026 14:25:33 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0382.014; Sat, 5 Sep 2026
 14:25:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 05 Sep 2026 15:25:32 +0100
Message-Id: <DL7GA6P85PED.6EMA7BRKKBIX@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: gsp: fix a broken doc link on
 GspMessage
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20260905023800.1293631-1-jhubbard@nvidia.com>
In-Reply-To: <20260905023800.1293631-1-jhubbard@nvidia.com>
X-ClientProxiedBy: LO4P265CA0126.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::17) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO9P265MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: e8e33a81-8d92-4524-a98f-08df0b598bab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|7416014|366016|1800799024|376014|10067099003|18002099003|22082099003|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	o1uOR6OqrZ1J2Q57c2Zh8J/oDR/run37mXecjbGDsHR19O/JrYtkaOwcYd0emUr70Ak1UuQBRxLPVny8z2wJ+noRchxOCNBYr0pCbfb1Z+JMWirysgU3eypKBTRt1LMLJO+aMibpEZ2TskZPaC71eq1BliM8HN0k/mAhRP1+/vTrmGYswesYHZGY0IzjdqQJAGcNnES6mGpRiAhmz/v2vf6ERbmDkt5ZMHHCeg1cKH28tnJfjg7neH3x4L1E7m/PqtP0MSWvv27rW0glr2M7en1oOG/uJepcTMukKtDKOSf7Ej4NKWXpHEambN89q0fTV1OodYO44WSkp5BnrRb0OPL1529YGOe2w+8yq/uTFNluuwDYMRzzt02Nz7XiOmOsJH4q4Grxoe8m6gk+ubvFk250raU21nA80qHmezzCE6u6A1FK+d/eustTKUfU2VsFgV4GFM0lbQ9BMti1CmfW9NQzNYI+KtzkvC+DLLNn5Di59LoKXURxTVy0g3E0pQREBE5bqJXJq+pVsJIHAjBjnYKZpecENLkX45aFeuZOMXBFTC9vZLSI4eeVlQbnwGybwaLHS6iAYcGZ4j28BzAOtSuR0qUg9J9f7RGUQYgFp4eui6MaadePcmoGUPbLjIO+f9pXFH1+iO9wOfxWN4DS8xXG3hQRDc2NC1046f8P9hE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(7416014)(366016)(1800799024)(376014)(10067099003)(18002099003)(22082099003)(56012099006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG81L1ZmeEZ4Z2xZRmxoanV2QnpKamV0dmtoamFvMlhUOTd0cEVGZFdlT3lz?=
 =?utf-8?B?MFpMMjZhOGRPb1lZbHR6Q1hFYzZoZ0hmTW04ZytGdEludjZySXhNU0ZWZmlw?=
 =?utf-8?B?eXMrZWdlRXIxVkR6eEpSSG1FbWYzYzlQTldjQjVWMGZpYUY5SkxldTRUUDBT?=
 =?utf-8?B?b2toMUFYT25pMDY5dFE1SkZ0Ri9aVlFSNlBtRDdzTFlvbnArbFRsTWNrd2wz?=
 =?utf-8?B?RHBZc0ozUGQzZGFVTDhPVXdjVitQSUwzUi84R3gzYnB1WGJSYldHbFBwYlha?=
 =?utf-8?B?RUpMU1ZvNTN2UXBYOGVoWWpXWjROMkNMeU0reDdackhOSDdOdUNPR01JMXo1?=
 =?utf-8?B?ekVWVjhwS1E4VU1QejNtOFk1K05LTXZKVHBESC9kdklRT3RjT2UzYjAxR1hU?=
 =?utf-8?B?aDlQeGNZK1BMd1U3M1RERFZnNlR3OUx3eHd4dFk2K2RicEh6ZXFSSmxxTEk0?=
 =?utf-8?B?cG9DajU0MlQ3RU9EM1FhTXUveUdRL2wvZGRRR3ozRVlIQVBwYXl3SnkvTWhC?=
 =?utf-8?B?Vmh5b2Y0dzd3eWdPQjlEaC90by9GZ2JORUtTTVFoNWFmWnMrOTFWb1FqN3Z3?=
 =?utf-8?B?bGZuQUE2dUJ1d0pyMTJxemdWYjNOcTl0VG1CYjd2Z0k2cEZRMWtvUlB2Q0pn?=
 =?utf-8?B?eDlZN3ZFZmxsemorVEozZUhsNEtDYVpRUjhha0RxVUo5NkZ2Ty95emw1UHps?=
 =?utf-8?B?OGl6VUU0SDJsdFJNVTZXdDhsbTAxeWU4NXpQbWxOek1Zcmd1UmhkZTBqbTJ3?=
 =?utf-8?B?SEpBOGYwUHpKM2ZrNFY1ZlpGOUtZalZUeVpvMG9wL1RqUUhGTm1EcFRMbmlv?=
 =?utf-8?B?T3cxNGhIdjlkZVRGQlVGWEorVi9JSFp0RjdYRmtOaTdjY1lDWi9TYm41NHRV?=
 =?utf-8?B?clVxcWxNV2xlcENrTzA2clN5cWVVVmhDUWFub2lJNEZweHJyL2J4NmErd0sz?=
 =?utf-8?B?eW1PS0pLYm1JWmZxZDdOWHo1R1phKzF0K2pabGtUY3hzVVdIKzI0NWREeElN?=
 =?utf-8?B?cXBvTkFLOHRMUWZjN01scE8wRllORTdWbG9vbGhwYm9QOSt1WW84NVNGTVBE?=
 =?utf-8?B?U3JHZ2tNVkJjRTNlbVR0ZldJRFZhdFBKSTRrRTlUZWlDQ3F1dmxETHF2NXJo?=
 =?utf-8?B?MDFjVklabkM0TWttS2xNaWtxbW8za0NveU5kZXhmMGtsVGh2alVxZHNseVhR?=
 =?utf-8?B?amo3Z0FDYmxoVjU1bUo1a3pIb21rWWxLRjRPVVR6cGVaK3FlWkNVSUN1amF0?=
 =?utf-8?B?M0gwNjZqcHRFRGRDUTY3SGI0RFZQUktvTFQ3dEkwZ0trVjlzd0NYM2NuVFhE?=
 =?utf-8?B?YWc3MVFKOG9zWFJGZVA3UlZobEtLbjZFWUdEdFV3VzEyR0FXdXRZbUtOaVla?=
 =?utf-8?B?SnhtSFBRREZTQm55SUF0dG5GWC8rdzJrYlQvLzdUdnoxNWNKT2U4NzJQbGk0?=
 =?utf-8?B?bWlDcWtMbkxoL2w2ZVRROEJLVGwxaEgwWURqRVBFd1VXd1lTSVBDMHNwQXlH?=
 =?utf-8?B?TWcwQm5CUmZDRGN0alE2c0p6enI5RmwrRG1BRjk5UjNqNWZFeHVKYlEwVHNs?=
 =?utf-8?B?WWlKbVkwb1ZUYjkzRXh3QWhkMUlpNXdsZDl1YzhDZVJMK05RUzNhbnJmVmFj?=
 =?utf-8?B?K0RKWnVPWmN1ZlBOZnBiek9vcmxLSWZFTHQvekcybXdrS1laM0JDbHFNMzAw?=
 =?utf-8?B?cGNNdWhKRHJhVkVEbFk4WUJYYUg1NDkvY3ROa3lCenBsd1kraHRuTUF2T1VF?=
 =?utf-8?B?NnhIaWNGR0w4WDBvb3dObnQrb2QrYkU0L25VRmtGVkViaW5COEE0Y0tTdzJl?=
 =?utf-8?B?ZkYzZ2tKM1dzcHlKQnZRNW9QaUNHbEw1VVpseU00Q3VlR1VpelBTSWllNzhq?=
 =?utf-8?B?eHFvTEJYU1NTeWtaSzFpanZMaHgwNC9yVTZpQUJPSXlHK1dodTNKZFRla2xJ?=
 =?utf-8?B?dWRmN1BqdTNCQXN5andIQzMyU0VXeGN0TDF4bXhQck1yY3VGWnV0Q1htSits?=
 =?utf-8?B?KzltR0xmVW5jN05iTE9VMUdJYVk2UlFId25veXAzNDN3RU4ra0Z1ZThwc1Fl?=
 =?utf-8?B?WDBwT0JZb05ua3EzQy9yaThsd3RWTkR0amMyTGNCU0dSMFRqTmhSMGdGWE5o?=
 =?utf-8?B?L2tpT08ydVQrQ0Z2aWVTbGZPWVQrQkFtOXpTa04ySHFXOXoyaklUZmRRL2dM?=
 =?utf-8?B?MDR0NzZUcGZ2L1FMRURjQVVJbDYvL0puV3JzeHpGQzliKzU3L04wU2I5Rm1t?=
 =?utf-8?B?NW1CckF4M1V1MTJib0RVd2F5STArRzVUSDdWWWRzWFJ5UmlMV1FNTER6QlFm?=
 =?utf-8?B?anBYTTRVTzc5c0twQ0pkOG94Tzk0dDJqczQxYzZxREpQRlQ1SEZhdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e33a81-8d92-4524-a98f-08df0b598bab
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 14:25:33.3788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3TPFsLoZPP0WzIWhHpPF5PM8BcUoWU3xDEPJzmNlrYgUW25ijUZUatC12C2npy7oMYlZHlXZnYl5K/wllT8pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7587

On Sat Sep 5, 2026 at 3:38 AM BST, John Hubbard wrote:
> The doc comment on the GSP message type names Cmdq as the type that
> defines wait_for_msg. That method belongs to CmdqInner, so the link has
> no target. Nothing catches the break, because rustdoc resolves a link
> only in an item it documents, and the kernel's rustdoc run skips private
> items.
>=20
> Point the link at CmdqInner.
>=20
> Assisted-by: Cursor:claude-opus-5

nit: kernel policy has changed and this should just say "Assisted-by: LLM" =
now.

> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

