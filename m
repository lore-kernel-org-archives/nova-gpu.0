Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.80
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530355;
	b=4jit6mPsLueuh6ZctYbClcyi+QjIdhv0xUROjzHSQ7lljaRra6kjJjy5YRyKN7lxOP1j
	 T+3dyLXysDtJjcAmQ/AQDX0TT7YeZk8OFuRYBAUe31RCUVz+lpTvQjCQFZcSUbK6EBkl1
	 mxmmSBZPchab//zPllRqrSTz7m+eY7gb1RI1A8RrEyCKj29vY05uruaQdko9kbfqCuzhf
	 FK6KiOOK+mYuiYeqXfMlxoJB3E0QCC1nbjRkezo4w1ZUXRtvv3Ax5rbtc8p+BFO0RM+Bt
	 SvAXtKhl9K3f7xYqoa+dn1r2xt0DpDAp3qdZEIuJw6BogCwHEdVQmUR7VK7jx4yqjiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530355;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=PIXpKIqMq5WzTh0eCDO0ZwzHqfN1E/57FC3UrKQYTtU=;
	b=Ej+4++D4hVcBgiwvru+9QWYhn8mbB8gD5zj9Ul6DzjvDGn7RjoyL30er8NS/zzdGBR9x
	 RoVy+Ehx/aqm5aZJ+sxn+1gnajW273rjS+BWWV9m/eKTgCb89FKTKW+X3gfV1cwKhFOO7
	 ut6p+FCMCUlMZfWqQbOKuH0thkF08Xa35RNjZEQ3KEw7sazDK6qPOi1pbqG94QPhwJt+F
	 Ih5zp4Pt4GWkxu9JY2P4QMk3Kf0JOBLZ1X1PAHVSBFnzcQLV4848O08QEHnVZjUt54/+i
	 98Fr1yF4UY8T9/NDs9fpE0pfFuZv9Bf3gT5dNTIiSgbKlbvJBDc6+2v3o8OmYuCfGZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=sNDPj5ym;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.80
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020080.outbound.protection.outlook.com [52.101.195.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849CB606A321
	for <nova-gpu@lists.linux.dev>; Tue, 24 Nov 2026 14:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 849CB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=sNDPj5ym
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MleEJdpvdZ1RZpWL9A3UqmjgG8ioE30YQIryZRr8OLFSK6oT1a7fU9i9XhhfcgTm1UaPyW+0hXx4csyGhZY72dHrrhlLj4wN0zfLOT98gjEIFMysP/wMN7ZcpEjTUXIzKG34fe3ZaCdj0zA99jeBw3FQ4qO/l7xD2ru3+Voe/cH4+1JoD4bAGc5VXWXspefvVkcUruR9ZsUW6uc+uDGi3hie7ol0F+D8yVnE5GlnSItPt/4aKg++TsW9/XOzzNYZNt6oQ9XZk0g8QvZEmDBm6XulGWB/I3JmmJd9ymxR2JdCR7ty9d7iwASqaou/qtMJhfBVkldxds9yIM7B2X9RaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIXpKIqMq5WzTh0eCDO0ZwzHqfN1E/57FC3UrKQYTtU=;
 b=hqiU1bgsXd+mnfCvAFqnWQSfXpxhf/LcyNs8XQ5AxZUNwMqGwP/JvuCPnmHh8C3lpg42VqvClKw0yrKWNh9/lbZ3M+swwi3EgZc8Vzev7is9Y/EELkdrvMJ/Tb6TscW+89K/7PdxBnI7J6ZBnVHv2HdAcPzOo5q0WW9ad1R2suVwF2u4/IL5wtPTtcsH7JLcQp6Nlt8uVFAof+NR8y9bK3aR9VdlZFznYtkBeUmqsafnXcXhswkZ0kf2T1SpxX94QUrAkBdobj5VpwVPmnPFYtR4vL/JszFyfqrYlEQPgmzfbhla1Oot/0xH1tVzmqfygZ8mc5YUuK8Tm56CkIKtVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIXpKIqMq5WzTh0eCDO0ZwzHqfN1E/57FC3UrKQYTtU=;
 b=sNDPj5ymK0fc9vVePl9SXYdHa91Ya1ZZb/zISUMQFPEr6Ytk4k4HAKsJY5xI5OKiJhqIKBkq81We0dk0I4VImne/zf6Nlto4/HpKLM5uBh7vFUMEiQ/uYJ/8RPFwfvPJ661VBN8gIbbhVoXIcJkwnIJvYI5RhA4Y/svwpcB8RRk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by CWXP265MB2581.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 14:25:50 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 14:25:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 14:25:49 +0000
Message-Id: <DN3IDZ94G4NN.1FUTSE7B4G1ZK@garyguo.net>
Cc: <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <nova-gpu@lists.linux.dev>
Subject: Re: [PATCH v3 2/2] nova-core: only bind to GPUs when explicitly
 requested
From: "Gary Guo" <gary@garyguo.net>
To: <airlied@redhat.com>, "Lyude Paul" <lyude@redhat.com>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20261124-nova-nouveau-gsp-v3-0-e1440479ded6@redhat.com>
 <20261124-nova-nouveau-gsp-v3-2-e1440479ded6@redhat.com>
In-Reply-To: <20261124-nova-nouveau-gsp-v3-2-e1440479ded6@redhat.com>
X-ClientProxiedBy: LO4P123CA0138.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::17) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1cb::9)
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
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|CWXP265MB2581:EE_
X-MS-Office365-Filtering-Correlation-Id: be345a8a-4380-47a8-acb7-08df4a36d699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|10070799003|1800799024|10067099003|5023799004|4143699003|56012099006|261022105027099003|261026121527099003|261022113327099003|261022075727099003|261021121427099003|261026140227099003|261009223027099003|261102123227099003|261028144727099003|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	DjsY4QVMw+Nhj6CxDVBC8ivopGMzhqIoakXUlxoAmeFQJlWsCxMabIwd+HjfJQ2brYdODwxSOUarNCDMHTelnW9uDl6CqkzmO3b/MZnmaBs0yTvHxD0yA/1uKkDq/WmygGYFyauqDDkK93ZjEOucPE1gv9lil6sXexRwFDZkEG+lOSJ3zhVIyMVGR9bOAw0I3b50vQvRgw69+InNY8yaGJHTPsHvnKgPMkfFTmMw1BdfkYyq9kDtTdlVYVYt1dNy46ea/lUZpcfAo61KSbP0Ggn+a9prWey269XctVck0JVUtC1XpbDrQFjq3+3nKYa8pTbNIeROnmHJFf6SE4p17uGKOtqPGL+yZNs2n5Q0kR87Qjoq9JRxeLIZHFmvu4kFSeVtkHB3ra6ydYh4Re7ak/lvknzOUkJpGa2hEJTL5O4kd8iRP/soka05q7HmIiCiltOpiM31+8G9UfPzGc22x5JrApd6/iLzOUi8FfSHzcQgfrrSyk63FXD0zo7V4jnSCiJZnCBBHQa2zgXUcqO2z679xFxiwY4oM/23uQ0SX5AZ6v/7ZaHnTQTBMwhAinZPyd2bHNYupJilvXtQh/zdkvEllkQun0+Mf/An1NR8b4uggjbU7thAmszhCmg33+STHxy1hsaDXJM2/iOyFR8zGFmXIfjVina16aCK4354pWU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(10070799003)(1800799024)(10067099003)(5023799004)(4143699003)(56012099006)(261022105027099003)(261026121527099003)(261022113327099003)(261022075727099003)(261021121427099003)(261026140227099003)(261009223027099003)(261102123227099003)(261028144727099003)(6133799003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cU5xK1RNRXVFcjRZRm9oaHRuM1hETHhoY2pwMGVValhPcFJTdkJaU2RBaFQv?=
 =?utf-8?B?VXY0bFl1ckt1c2YwK3JwTDJ4Q0ZCR1JLc3hYYjFBSk4zem12T0lzbHp6NGZP?=
 =?utf-8?B?YkM4NmU4dWFTaXdORnhJNUF4Ykk4c3lmMW5ydDBMa0hpbVh2Yk9qNnVwaFEw?=
 =?utf-8?B?QURBRENZcy96QS80cDlKRkJURE1WOGlwSTZZNG00WW91eDhtODdiM2VqVTE2?=
 =?utf-8?B?ckg2NTRZQnY2OWw5RjU4c1Y5L2xFZ0ZDaENVaWxGNjM5eWxqRjlIS3ZTUVlw?=
 =?utf-8?B?ZVJDR3BHa0E3N0U0dlNhMkd6RGhaeldLQ1JDdFJFTVl6dG4vUU12R25XRW5L?=
 =?utf-8?B?dXRsSDBVY1AxQTFLa1FYd3dLRDVWN09IcnlIb3J4S1BGR2RvTkxPanp1MWJz?=
 =?utf-8?B?ZlRRNG9FOHlCSnZXYnhRbFpVcUU1S0NpSlZGdlM4YUFMNWNnM2Q3d1NFTnpK?=
 =?utf-8?B?V1NSQUtyVEM0QWxUejIxUHA5ZE1RcER4RXVETGluazVXd0hjdm1pNVd3OHN6?=
 =?utf-8?B?bjRWaS9jT0RsbXo2M2J2aXNSSEtpTFBGem45WlV2TzJrUE42dHpEb0NES3JQ?=
 =?utf-8?B?S2FFa3FOQ04vNStpRmVBSncyalpBWmpiUFJFNitVeDZucng1T0Z6dysxcjVm?=
 =?utf-8?B?cTVaa01WNnRrWDV0Z2JUNE9sOVUzdlU5dTBtQW94ZldUdlJUSW8wNmVGSE9R?=
 =?utf-8?B?RE5mM1ZmamJQVitMUURnNGpMUndEeHFrSXlXa3ZkOTRFTW1LdU5hdUpSSWo5?=
 =?utf-8?B?UzFSdU01WFVSYThLbEVzVE5QZFZHS3lsU3ZLSzRPOUY3WHdDUjB5OGZGbFdr?=
 =?utf-8?B?alZZOVM1ZUNCWjBRS0x3cURiQk9STEx3czNjSjNMa251dGZrZU43K3pYUVZi?=
 =?utf-8?B?bTlZeDk0NTFnaDhzdnpTWE1mUFVhYXV2NGViMnRlZUdjYTdWNWZVdGFlVHha?=
 =?utf-8?B?QnRVUkQwSDZWN2hDVmMwZkdzbm0xeFBYRmpxMStLUldaMkdRQTlPVkZZTjJw?=
 =?utf-8?B?TkJvRXZqS1RscmIzU3RsWWNYbUpsMVppWXM3R1haRlJaVEFBU2s2WTBKbkZ4?=
 =?utf-8?B?dnQyMUZKL3BVNjJJVWhQcEFOL3ZxZEpWck5QT05RMDRjcUNuVCt0ZmVOTlRW?=
 =?utf-8?B?TjRtTFJhNHhBRnNMZTVhSjMvSlFvUXJtbFAwaFlhdThKVkhNdDVaeEpvYUdE?=
 =?utf-8?B?UGg4cVNpdm40ZEhWYVN0OHVDL1lGR2VicnpmWUxwdVZTMktXaUxTaFd4RW1X?=
 =?utf-8?B?dWNTWTltOEdrYkdlWUdBQlA5Wlc5SFlManVUMGprTGZ6TG1hYVRwWmhlK2gz?=
 =?utf-8?B?TTJJQTQrQkVHOTRFbjZBTWpHZThNWkswNEQrWU1QaVJXcXd5dUw4SE16TzBP?=
 =?utf-8?B?ZTF4bjhXUjJvbEp0M3p0OWhtbU5oL3VPdGoxZWorQ3pPSkRiTVNyTnZVS1lI?=
 =?utf-8?B?M3EzdUJjMjZsVlVYd1NJZ0N2Nko2Nk9WelpiVUVEYnVwM1laWVZWbzE3eGNl?=
 =?utf-8?B?VFRlSElFQ1I3dm1aTEgrbWxOUUFSY2I4YkR3WERpOG12Tk1DOVNpTC9wNVZu?=
 =?utf-8?B?Tm1VOCs0dm9lZmxqTlRwQ0R2alh5YlJUYW1qQkJvak5uc0VWaUNGZ0w3MmQr?=
 =?utf-8?B?RkhRWUFtRVFoTFlTOWgrWXVhV0t2SGFSN1ZrNDJQd0IyYkVycjFMbVFpeUdO?=
 =?utf-8?B?SERDVk94M2RXS2g5WThXeFFLaFByS0lIdmRCdHhqeDdCeW9BU1R0YWtNRGoz?=
 =?utf-8?B?ZkdBZEdCMTkxTU9ZZStqdjJmSDNxTlRjOHhzV0V6Q1ZQRy83dDdLZjlNNlhG?=
 =?utf-8?B?N2JEZE1WNmhUVmVUQTlESlNYT2ZFVmx4Y1gyNlQwNFNJazdoNDZxcWdaM3pU?=
 =?utf-8?B?eHo0Smd4NndoMWJsdk9yd1lLQjJTdlZIZUtTYWJYUm9DUjhxdy83K1NvUFJx?=
 =?utf-8?B?RTFjNjVLQjFGOTZTOXg3VnBWSmNmOGRJZE5RMGtBd2JRc0dGRktqZGNaLy9N?=
 =?utf-8?B?ZW5zV3JCTHFSaGgwemdsMXZyUVcvVWUzejRKM2gvZE5mNjAvK2dqbDJOM3dW?=
 =?utf-8?B?ZnF4Ulo4QmFobFlNeXJsZTRBU0lFckpCQUxDaWNNTUtEUHVHdFFmZXRSWlZz?=
 =?utf-8?B?UGZMSE1FVTlVY25Tb0xQakJpNjhxbDM2RzhIRXBHdC9NRERLMlhzUXhUcHVB?=
 =?utf-8?B?Qk5KeUI1QVJDM1IySXNhYkJGbUJZMUdIZk1NV1VWWnBmcDVBQzhHSjIwL1h0?=
 =?utf-8?B?MzYrdCtrakxFdVNEVSt0cm1ISVMwQis1TUw1TzFuOFduU2xGYWhJcG92ZHV5?=
 =?utf-8?B?YlN5TTdBMVl3am5tWFVqaUlmR0dzTjlDYnllTTR2VjQrd1I2N0NBZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: be345a8a-4380-47a8-acb7-08df4a36d699
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:25:50.1446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: heBlfZrIYlSQCqZZQ6e7arFPUsB6fMHqPnAW27iEHv3NqS3lOewgOh6OLJTyvuyWZCwkuIhrZnXuroGdXPJ5lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2581

On Tue Nov 24, 2026 at 5:50 AM GMT, Dave Airlie via B4 Relay wrote:
> From: Dave Airlie <airlied@redhat.com>
>
> nova-core currently binds to every NVIDIA GPU it supports
> (GSP-capable, Turing and later GPUs), competing with nouveau for the
> same devices.
>
> Add the NOVA_CORE_BIND_GSP Kconfig option (default n) and a bind_gsp
> module parameter, defaulting to the Kconfig value and able to override
> it in both directions. Unless one of them requests binding, probe()
> rejects the GPU with -ENODEV and leaves the device to other drivers,
> such as nouveau. The PCI driver still registers, so module autoloading
> via modalias keeps working when binding is disabled.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/nova-core/Kconfig      | 21 +++++++++++++++++++++
>  drivers/gpu/nova-core/driver.rs    |  4 ++++
>  drivers/gpu/nova-core/nova_core.rs | 23 +++++++++++++++++++++++
>  3 files changed, 48 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfi=
g
> index 2e11e46c99c7..058742d50692 100644
> --- a/drivers/gpu/nova-core/Kconfig
> +++ b/drivers/gpu/nova-core/Kconfig
> @@ -30,3 +30,24 @@ config NOVA_CORE_SELFTESTS
>  	  logs its failure and lets the probe continue.
> =20
>  	  If unsure, say N.
> +
> +config NOVA_CORE_BIND_GSP
> +	bool "Make nova-core the default driver for GSP-capable GPUs"
> +	depends on NOVA_CORE
> +	default n

Quite a few distros have script that automatically select Y regardless defa=
ults.
What about just using !NOUVEAU_CORE_BIND_GSP?

> +	help
> +	  Make nova-core bind to all NVIDIA GPUs it supports by default.
> +
> +	  By default nova-core does not bind to any GPU and leaves NVIDIA
> +	  GPUs to other drivers, such as nouveau. Say Y here, or boot with
> +	  nova-core.bind_gsp=3D1, to make nova-core claim NVIDIA GPUs
> +	  instead.
> +
> +	  nova-core is work in progress and may not be functional, so this
> +	  is intended for nova developers and testers only. When enabled,
> +	  nouveau must not bind to the same (GSP-capable) GPUs, i.e.
> +	  CONFIG_DRM_NOUVEAU_BIND_GSP=3DN or nouveau.bind_gsp=3D0 is required.
> +	  Otherwise both drivers compete for the same devices and
> +	  whichever is loaded first wins.
> +
> +	  If unsure, say N.
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driv=
er.rs
> index d6bc972d47c7..e89967ef0cd5 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -105,6 +105,10 @@ fn probe<'bound>(
>          dev_dbg!(pdev, "Probe Nova Core GPU driver.\n");
> =20
>          try_pin_init!(NovaCore {
> +            _: {
> +                crate::NovaCoreModule::check_bind_allowed(pdev)?;
> +            },
> +
>              _: {
>                  pdev.enable_device_mem()?;
>                  pdev.set_master();
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> index 84f777844592..483e5c1d427b 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -68,6 +68,25 @@ pub(crate) fn debugfs_data<'a>(_dev: &'a device::Devic=
e<device::Bound>) -> &'a D
>      }
>  }
> =20
> +impl NovaCoreModule {
> +    /// Check whether nova-core is allowed to bind to GPUs.
> +    ///
> +    /// Binding needs to be requested explicitly, either through the
> +    /// NOVA_CORE_BIND_GSP Kconfig option or the `bind_gsp` module param=
eter.
> +    /// Otherwise, NVIDIA GPUs are left to other drivers, such as nouvea=
u.
> +    pub(crate) fn check_bind_allowed(pdev: &pci::Device<device::Core<'_>=
>) -> Result {
> +        if crate::module_parameters::bind_gsp.value() {
> +            return Ok(());
> +        }

This will reject binding via sysfs, which I think should still be allowed
despite CONFIG_NOVA_CORE_BIND_GSP. I wonder if we can support such cases ju=
st by
setting ID table to override_only if the config option is set?

If module parameter is set, then we can pci_add_dynid to add a match withou=
t
override_only being set.

Best,
Gary

> +
> +        dev_info!(
> +            pdev,
> +            "Not binding to GPU; enable with CONFIG_NOVA_CORE_BIND_GSP=
=3Dy or nova-core.bind_gsp=3D1\n"
> +        );
> +        Err(ENODEV)
> +    }
> +}
> +
>  impl InPlaceModule for NovaCoreModule {
>      fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, E=
rror> {
>          try_pin_init!(Self {
> @@ -97,6 +116,10 @@ fn init(module: &'static kernel::ThisModule) -> impl =
PinInit<Self, Error> {
>              default: false,
>              description: "Keep the GSP-RM log buffers in debugfs after t=
heir GPU is unbound",
>          },
> +        bind_gsp: bool {
> +            default: cfg!(CONFIG_NOVA_CORE_BIND_GSP),
> +            description: "Bind to GSP-capable GPUs, making nova-core the=
 default NVIDIA driver",
> +        },
>      },
>  }
> =20


