Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013037.outbound.protection.outlook.com [40.93.196.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C6546C4D0
	for <nova-gpu@lists.linux.dev>; Wed, 23 Sep 2026 14:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172743; cv=fail; b=R+UG68g6PEXnH+2CXTP8R41jH+jpWFXXA3UbyKg53z5qsfneOLKdQCcEy7KXlN2NzTuPMHMpOw/ukZE0YspOgjwE3LIPUjFyvA9Kl8VfZpSb6nqpoQOcY1+FToc8igckg6AUzLklXPNxEX4ZGFUTmOpPTLF1zz1BmzPYJpk9XRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172743; c=relaxed/simple;
	bh=0BafZf3OBrztjbz3eJzZQhfqQgAJ13qv1P3SLtTzV+w=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=CRdpN267ezjK4CHFj3FB87T0U/Q+9j1LOHJib+2u+N6O6+GVHUjYj3TCOQgRmitrPyTGhSM7nXb6cIAckME113dq55EE30dVg3y29vkh6H4iUchIaJaBTzKljWbKXkKFSS2CDg9ZB3zBqqLQEh2hc5blXbvgs6pvWFj9vPSi9Uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rnm10T20; arc=fail smtp.client-ip=40.93.196.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rnm10T20"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LzMnPniioyhAP0Z2bIEGXLQxgtLPRfmXBj8a1aqm/L8/FLWCgoTtcEbheTdieI8eerGgYOYhsu4ni+ERXJuPt3gcs/bQBRZXJKMpUWKaS5bgp6Dh+iCgo0ykMjm5Gxij9JUOcEoZul0OHTlHWoy8ca+HyFB8SgG+nSdZ6AIvpfg6soDg+zbNKxPe3GS133GvoeE03xCRVI9mjUuZAjKpdOS8AlWmmmyrq1/haiS71HunK67wAqJBJeD2CTOpuueWwttpFCvvwNDa4N8GRPxp3K6V1ktKUNIvmJC4prTtrP1mxwfUmVYOt9uwMyUHnT9V5No4op+wEPF3+naFg8A99Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTlSaqp9KOiGlnS35DBxtM6UC6mmwUu/Pd3HaXauiAY=;
 b=jpxLDKJrKm8HfeLT9v+gas3KBs1e5Pq+UKB51/Hs0kFvX/6w9fyD5W/3qPuTgF1wOqccNjRXxZEzqPnZzDfikR2rBmoTgt0oRue1cabz7qDOUXsn+O0Cv+hpFDHpl5XS6dpKOPe68bjGHo6G5ptJa6389J/RQb0QXLFmrFfqcBhbZ0vYzEXDNAQzzOqqt5v6143+QJ0IlVr+jzrLRj6eFyo0Y446YGobeXc9fxY1G0mLWvNgQY0/SgcOexy49PlhHrpwtH6OhrNRh1OZc9B0Cw52JMzBx2qk3N5vYqYMlJVL4SFpGJN+E9jPlIbvI6rRLWIaJiqPtw7IIRAiD8RBLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTlSaqp9KOiGlnS35DBxtM6UC6mmwUu/Pd3HaXauiAY=;
 b=rnm10T203rJ9pT6Usd8+WwG1OypnpRmSU6zmXFCC2pYAMffb8IeLicO9kw/bpk4BC+NAUS+ZAjoBbVsemVG2X/FytkdcMrHqvAI0FT7uhTdbq54dVpskVDSNnFHTqAt0Ww8i3OHawFwf3IIyG+CLiyNJA11pcIZtr+ZCcOMnJReCKf5zIsJwEIQ17fmiLLLInNDMik1lPszt0SHFlP1NrRfFq/SJprRL4Gdkk1f/DrH1ocDrDTH7fkUtiHhq1KXqxOaeURFZ3zwX98B22hkC9Xo6nAjWkwG0U0crzmTbnzuqXUPX+c5BdvV9dPThTSBprgrwOHsmPwgK+n6jttAQJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by MW4PR12MB5628.namprd12.prod.outlook.com (2603:10b6:303:185::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 14:12:16 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 14:12:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 23:12:11 +0900
Message-Id: <DLMR9RNSEQHG.6MKCJPP8NCSI@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 10/33] gpu: nova-core: add GMC send path
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
 <20260918010719.1176945-11-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-11-jhubbard@nvidia.com>
X-ClientProxiedBy: OS3P301CA0014.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21d::20) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|MW4PR12MB5628:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f50253a-df1c-49b1-9c1e-08df197cab31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|10070799003|1800799024|376014|366016|10067099003|11063799006|56012099006|6133799003|3023799007|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RBBgS0o0S+WKMJMnhPRPKRaycb9CoYsB/REGSyCNF2LIM1eJqU/d35s6oTT4sfSbigVS98RGxqMnneCQ8qSZ1yZua+EjEkvB1rIDf44vYWyzwg6vHiZRS9n90cd5QfqDbQ7GDV97MGSFGUg55qZX/T8hbZ86tnwmpzHpXlvO8yME8GlNnDK7CXgaZycacocv+lw2ctlnYtspBUDVmQe7i2boDnufrWvq+7xiKo3wQWOohl6jBqvbFcLONsOzwS+fEG5zBlgcMO2iTIdROSJG6e3WeWjVNoj8Mgd5I8kmfnYbtSrcalxVl9115VUzBP6nT68E+sOxNFJIHNTZ9xrStIBAxXOdz9iBSdkjtaq6ie9DOUEcfKvxH+dL/AogcmkHVht7QEztdLkqLElD10ehgDwxPGCUSQkLH5nUCesdj5MMSt7b3Fqav0p4m9b+ia+GT5946yW87cmn3gzWVDkhLIiWa5dcMD6Eej1UkWgh+6bjbIIpZlZhn1sj/eSWqgVj58SbrjYOAiOLmkDw3C3n3cY/GYGog6WApduGy08+GmHHpSS6x54eDhSqCdE3uc3PzQjGWbdEQxR+v2NfBtxGCPpF+am6sRKtHMmNarIfz59SkqmO6n1GKxa4vFswwcd2ZC/VYN9C1baTKCzhFzAFaOxh6pRXiMGFIy9lkm9Y9CE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(10070799003)(1800799024)(376014)(366016)(10067099003)(11063799006)(56012099006)(6133799003)(3023799007)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVkzNzZtd0s5bHRzZG5VYXJSK3NCT2ZuSGxkTlpFZWVnOVlmTGNFMVRQTzFw?=
 =?utf-8?B?MHBBL0NEd1hnSmFQZ01QNUVFZWF2cEtrVEZ6K0IxMlNkZkV5VjNaWW1FR293?=
 =?utf-8?B?N2hFeHYxZFJJUFNmQ1A4MDhDVmhWU2MxaWpqbm9hYnNGa3RkUVo2cmlGRGV3?=
 =?utf-8?B?dWdINUlINVZWbi84VFNlVGpWOXEvUDluNURCMllwQ0ZUdEZQNnhSV1NxUkhs?=
 =?utf-8?B?L1k2eUg0M3E0UmZORHRFWEtpOURaZjcwZDJIa2tmeTdDVEFwUGJPS2hkWnht?=
 =?utf-8?B?UEM2SnltcGthekE5U0pOcVBlUU45Y2FRS2JwNlFTL2pJcEVnMkdMSE5XWjcy?=
 =?utf-8?B?eHhPK0lJOEc0ZDA4QkRtS2w4bGl5cU5RTkZjZkJGS016ZFdHSFJlYTFEemly?=
 =?utf-8?B?NEliSlRFajk2dVhtS3JYVHplNHNEK2lqWUE5NGpQc20zYUNZYXVXSDVvMlBC?=
 =?utf-8?B?MStBVDkyRmlJeEQ2VUExWHpHUUE1VDhCaVZaa0F1Rm1vUlBFSkdrT254bHFt?=
 =?utf-8?B?aFpSdDlRWUFHS1ZMc2JNUGg4aE8vR3NObHY0SGNSUms0YmExL3plV3pjZUxD?=
 =?utf-8?B?a3BlY2ZGVmNjcFJLRWpKS21JOUhTL1B2blJ5TVlxajB4eXBUb3VvUVFtR05P?=
 =?utf-8?B?NmFmRkRLaGNqSk9vTGxKUW9lTWFLTlZaYlBOWmFLYkZBV2N6dUl4b2R6TmJF?=
 =?utf-8?B?ZmFWbGpEbTNPT0NsSy83ZTNsNktUYzhSTlRlQnZUeW5xcDlGY0JrOG1Md2dp?=
 =?utf-8?B?SU11VjlBTkJSSUNYVHBJVTExdjZwYkpidHJ3aWhmRTlKYVNpbWF0UEZSYTFZ?=
 =?utf-8?B?bWxSd21FSDBzQll3dVRSQVZMWkd2MUE3ZDRwU3ZrZlNqTGVMZFpPZmsvcDg5?=
 =?utf-8?B?M2pHN1ZvbGs2YTE5UzZlb2FtaUh3L1B5Q1d1ZG1YMm1Kd3RIellHSVY4Y0w0?=
 =?utf-8?B?WmJIV0lMdEM1UEFYL2FPK0xZRWw1RVZWUFZyajZvNWNGUVVKMC9oSS9QRUVJ?=
 =?utf-8?B?QS9sVmR5YmZ3YXJmdTBiY0JUQ25zTUc5OTJkdHhzcnBMaElOWmlubjJOazFn?=
 =?utf-8?B?eXorR1pETks4SFFicC9sMmNMNE8wQVExaUFwak4veHJnQ0diRzdEZUdWbXBw?=
 =?utf-8?B?RWtBYytXRHRHSDJBU1g3V1pnNEg4eE1zMUhmZVNSS2QyR1RQZjBpZmNmTDFB?=
 =?utf-8?B?Y1RiNnMxc3gvQU9IQ2t1ODluUlpHN2FTblFBZjNKS0J3UHRERDArNVQrK0Va?=
 =?utf-8?B?dmhLamg0b2RZbkljU3JEWEt4M1o3NnBrbWszL1NaNHpaOUtGNlhTdzkvTm5h?=
 =?utf-8?B?eldKYW4ya1RjajBGVmhEa0VIbmloSVBaa242UWtqYXhEeGdtUTlqNXExWFAz?=
 =?utf-8?B?WVpwTTVtMnpSWUF1RFN6Tmduc3FFbCtmVW4zOGJsRnZzdTNJaWNzZHBvU041?=
 =?utf-8?B?a3EvdmVwZ0gzUDBqY2wwMSthQ2hOaFNQdXFja1dCbzNsMzhPUXJlL3FSdnFJ?=
 =?utf-8?B?T0ZueVc0cXUyN1hSeTNXSHZ5Z1hzbFpxYXhsb2drVU9hRlhXdHlabUltVVFW?=
 =?utf-8?B?aU9nc3NxYjlTVXd6SzJvNTQyMmVVMFV0aHl3ZmdSbE9OdldvSjlDNzZiS1g1?=
 =?utf-8?B?ejYyREFDR09KYVpFaWFlVjVNb3lvOGNySE9DSnJLVmdYMWUxcGV3OUpnaFFk?=
 =?utf-8?B?ZVBlcTFiNGNubTRxZUthNENUelNWWEVaNEMzMm9iaWFZVFFHMnpyVGFSRldZ?=
 =?utf-8?B?RzNreUZZNGt1TXh0MU5zNzNRWTFxcHkrV3M4UlVQdTV1bE4rV21DUmM1aEdT?=
 =?utf-8?B?MzBpbzdZeDNzRzFOWG9rSmhjTTkyQStiNDVMWVFxbnFVTktzaWphbFgyWUVR?=
 =?utf-8?B?cE1XS2tmdTMrS3d4dTZEU0VsOE5mMmozVGZnMlF6eW9leW1OZzBraDl4S1k4?=
 =?utf-8?B?akF0UGlQOGExRWE1cUJ4NjIwd1NPYzRWNHB0NjJnNTNhYm8xTXUvWUpRNjlt?=
 =?utf-8?B?S0VOaFR4VUhYNEMrNmQxU1VTbWRZRThrZnB2Zy9iVTArdVdjNGJVZTY4bzFG?=
 =?utf-8?B?VTluRVFJcTB2RlA5TVlETWJPWXFpVW15cDVySEtZYXFacUxvMWw5c1Q2VzB0?=
 =?utf-8?B?ZnpmWlJmNnNGV0hVS2t0aEJoUll3b1dkRll0M1FnaTJWVkR5WHVwN29waEhB?=
 =?utf-8?B?NjJDNFBFNnFTQzA5NHlQejNBTFoxN25BSGlrdlNxV2dwZGpyZDlYREtvc2lT?=
 =?utf-8?B?ViszNXgySVIvMERicU5GU01oNldVYm5tOTJ4NzJIQUFibU9BSytQS044R3Ji?=
 =?utf-8?B?bTAwa2tGM0ZjZnVUei9Tc3JXUUZQcVN2ZGwyU2NqWWdmMWNsWldyUlM1UVpk?=
 =?utf-8?Q?/xcvEw2iaZJ/PPNDCV6Smn2f32/JILaYuiPAds50b25cT?=
X-MS-Exchange-AntiSpam-MessageData-1: pXcjlF29yAvgGg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f50253a-df1c-49b1-9c1e-08df197cab31
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 14:12:15.0410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZaqXkaTYO29CMpowWYGXKgMU7kX9/K7Y72u9LxO94ey7BAT0SP7RO4F2lkYviSqXIM6n2FWopWk8KIteqeQ6/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5628

On Fri Sep 18, 2026 at 10:06 AM JST, John Hubbard wrote:
> The r000 boot protocol has the driver send GSP_INIT, the request that
> carries the driver's configuration to GSP-RM, as a GMC command. GMC and
> RPC commands share the command queue and the RPC sequence counter, and
> a GMC element, unlike an RPC element, carries no checksum.
>
> Nova-core's send path filled in RPC elements only, so there was no way
> to send a GMC command.
>
> Add a send path for GMC commands. It has no caller yet. A following
> patch adds the GSP_INIT sender.
>
> Assisted-by: LLM
> Reviewed-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 43 +++++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/gsp/fw.rs   |  1 -
>  2 files changed, 43 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index a1c9b7cce255..c0c3d8596b30 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -54,6 +54,7 @@
>      driver::Bar0,
>      gsp::{
>          fw::{
> +            GspGmcMsgElement,
>              GspMsgElement,
>              MsgFunction,
>              MsgqRxHeader,
> @@ -749,6 +750,48 @@ fn poison(&self, reason: fmt::Arguments<'_>) -> Erro=
r {
>          EIO
>      }
> =20
> +    /// Sends a GMC API request to the GSP.
> +    ///
> +    /// `payload` follows the GMC API header in the element, and `max_re=
sponse_size` is the largest
> +    /// response that the caller accepts. The request carries the next s=
equence number, which GSP-RM
> +    /// copies into its response. The number is consumed even if the sen=
d fails.
> +    ///
> +    /// # Errors
> +    ///
> +    /// Errors from [`DmaGspMem::allocate_command`] are propagated as-is=
.
> +    #[expect(dead_code)]
> +    fn send_gmc(&mut self, command_id: u32, payload: &[u8], max_response=
_size: u32) -> Result {

This is basically a mirror of `send_command` for GMC commands (or rather
`send_single_command` since GMC appears to not have split commands).

Only it's not quite as good: `send_command` is generic over its
`command` using the `CommandToGsp` trait, which is nice as it
establishes a relationship between commands and their expected
responses. The GMC counterparts completely dismantle that and work with
raw `u32`s, even though it would benefit even more from having
structure, as I see later that each command (hard to tell though since
we only have one at the moment) seems to have their own maximum response
size, which could be an associated constant.

Looking down the series at `gsp_init`, it passes both the expected
command ID and a function to decode the response to `await_gmc_response`
from a dedicated helper, whereas RPCs just need to call `send_command*`
and know whether to wait for a response, and how to decode it just
through their type. That GMC is unable to function similarly is a
serious step back.

I also want to understand whether we need to keep using RPC alongside
GMC, because by the end of this series RPC is still there as dead code
(except maybe for GSP events?) and if this code is here to stay then we
need to factor out the send paths a bit more than that, and separate the
two mechanisms more clearly.

Because right now both `cmdq.rs` and `fw.rs` have types and methods for
handling both mixed together and that's quite messy. So if both are to
coexist we should have `gmc` and `rpc` sub-modules to keep them properly
separated.
