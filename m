Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012067.outbound.protection.outlook.com [40.107.200.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931313750C4
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 06:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781160613; cv=fail; b=OeHppY0Zd8LAfPqpgSKKomvKhuxfm4XltQuggmCPgq7hTfbF8RGPJKXkgqZU9bGUJbB0my2uzFmSPCGfCRRHCYMctxgEXBpV8MGSNeeyFXgP2CkjSBcKXuWvHtZgMGgtdRJuKq/8mU7hHJ23dkb1ZcyLLsV3Npch2lRtygXgAfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781160613; c=relaxed/simple;
	bh=ZU/u5VL1uGXrRIyLKourboBeiSY/qXKp2i5iHqXRwe8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=rO6d6e4F8hGrcwCSvhQSmLWYlPA0Lz71NB9n1Yi42AIbzqZTI1/Mps3EMIHWE7DLrhVbwhk1bvM/eSjTRmjx0aojNrIeDBkkPHP4vmS/g8XeCt/gZNoLeCgqsod4wkjWT5riaTrGlR/FDCVDg7g4ZH/7V2MTd3kP7QLmnBA4EnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H/jGJywU; arc=fail smtp.client-ip=40.107.200.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H/jGJywU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/71i9CYmC6fb3/EziiFk7/5g7BkkY+9RsiT9oLGBZRK3S+EOhR2DnxgTkh4rDrVuSA5M69j8GwCadC1f+gAJHK8k2kKrAQP5a8TR7luPpsKAzkqcKCbWFypl7C+IYCVHvXcOCuJsKWFsVMyrhVAWnIAGPE5OicSWoBKCfH5Y9HZz4DeEkj0mEQQx/Wsk9c4iy6R6qyU3FiwoNx9VfMjS8/HQQfZQREu9tORqAUIIbY/tO1XRfBxtHI/FcR8iZlO7qQP8Da/qyWvTStM+vJYLrpWAoVnAyDUu1wqrk5L7oThF9AbzwN52ep4C4F9rU6HYjinG6A5fLreWzlPYcBGOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzD7U9jEfdpfpy8rZozul72hskebVoez0VOtKjpCoHc=;
 b=dQGuCGpxBYJEBhjMVPHyClKXOpD8fYjnBRzQF9TlcKeNKUrrVBw2WFC2Q9MVFkbZ/wKw0EyTPmaz9TZ8Lgq0ueE5q5f8SEsIpYHMlA1KY/WBH8l6SWJFPxNS8YRmw5CqIMA8aixUDpgyEug0EPUJoZPHRixOw02WIYjhtBqwS556XOYlg9Ak/5TANMehuGOWXWYUR4Pxqqw3681qxAgVyG5Z2J+fvupOgwD1uB6RXlQma3L//EiusfOrycHx2KD0TOQmBJp8Qnxt2rTF/5pV9IvMDL47e525TAjdI7Q6NuiDPfz8N5B474jt4TsgEsq0nU0bPHi8R9MCpG7UfrMIKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzD7U9jEfdpfpy8rZozul72hskebVoez0VOtKjpCoHc=;
 b=H/jGJywUD/5yXNxU1m1/f6+5EuLwY1ebEl5jtkIt7Oc11Cd07VAcpnedtupTYgN1Y7JNCRB1P/96fbfuewZraML9EZxTiirsdXEGHkNG9TGOG6mD2ikDHHRcUfJ90fj2ajDaLm/IAZbohQkHN8OvnCV/UGf+Gxg0dF+XmAwbJQSnWoL76JCWCVHJqFR1oLdxSM9pFBTkcBfS5UlzmjYnRLmKbc3LfnCkyeLGwZdOFFu17hxQEVdbm/VcjRflBVJV7g8Hegt6FhhE8RuQeGZZZi75/ez2WnAmMkDsgIMZ1YYoqT7KT/MtXHRnkvCj9Q4D4ohqHkvvGR8n0SsGpoQthw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW3PR12MB4444.namprd12.prod.outlook.com (2603:10b6:303:5c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Thu, 11 Jun
 2026 06:50:00 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 06:50:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 15:49:56 +0900
Message-Id: <DJ60QHQPQF70.1SOTS6KEVEQ5C@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 <nova-gpu@lists.linux.dev>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <zhiw@nvidia.com>
Subject: Re: [PATCH 1/8] rust: firmware: add request_into_buf()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-2-ttabi@nvidia.com>
In-Reply-To: <20260610174929.744477-2-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW3PR12MB4444:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d16fff-6744-467f-3dee-08dec785a805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|10070799003|1800799024|18002099003|6133799003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	/zIDtkxTFbsRx60ClLu/5s0q/4CiM9id8HsDP6Mg5oAKgnlPN3DNj/HxP7XZym6eGNu7ZUGxPQxsBOyKG4ArOWQM6M2wB4i2CH0Pgw6sBWueEXSfSFz2kWI9/DW/dt6p5afEtzakfWpYz7YCw4UjWs/ZGF/frNCpPGyHAvAWKb76rJ4sAP8AUd1KLVBy+6aPRTLphGaQ7yBhXYzncqRi/SL1M441quBp5vwLTpygm1l2v4ekl/S/aPbkWHR1ahws+Vuoz9UB8crEdPFedPBlDfAiRiWriOtKzpKUEQO4QG8jX1nYPVWYtQSve4G9zaDD2OvjqSH6jCznQWso7gxUALoGrdYjpySaDQA2e/W/BzNr5fqpMvfMTW348Q+4ArC3RSs4ICeWAm5BTFWq+BGyjRz3i9xo4bTPjlL+AVN6BTE4wzTkwMvwDE3mVdd1/iinZ1e9TDaClyIsCbzP6h7rkCqwM1+d4a0OItQpeKS470KfcA7ETUkk6iWFMP9tJHCifGHrmgfbqKgX41J+3CN23p97IiraVNhP/XO4QcsRojHZzu2jPwuQ8OBlvJjkP50O+XVzNTKlwo1+C++Czq+qu2V9V4+ZthaEv7/7/0rUuYw7EdDVFiu5ss7AS43//r6h4Dq16Hys4lCF8NBs9hZ4V4B8cPAjS37b2Oh22k0F85EzGph05B7a8kDi4RQrOk5Z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(10070799003)(1800799024)(18002099003)(6133799003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0dSdDlQcEtrTnNWUEozempxSW5aYVNnQXFvM0NRdHRmNWlsZEdTV2NuQm5i?=
 =?utf-8?B?cHl4ZFlaQWlWcTF1SERtUE9DNGU1RWNMV1p2cG5kbE9rYThUQlE3dGp0K0xX?=
 =?utf-8?B?RGtrd3JWd1hmMUhHcThQeVcycHlmTFRmV01kZ1E5U3kxNWlTZmVPNWs0ZjVO?=
 =?utf-8?B?cGQwbUtwUE9oOFo0QVZmQ0tSMGhFN3piVkVuVzNmeUZ0WFJBNFNHNW16Wjhj?=
 =?utf-8?B?SXNNeVR2VnpxYkhOTkN3aVpCSmplT3B1ZEdXcEJGVUFFNnVRcnhNQTVLV2Ro?=
 =?utf-8?B?VFpiZE1PM1pwVGJmdituTmluWjdWRTFLeE84Z1FyazJDaUtjbEdYZThGc1NK?=
 =?utf-8?B?a0hPMXlRVkNHbTFvaVdLSXdSVHFKRURBYWpDQUJKbXl0K09wekEvNkZrYVJ5?=
 =?utf-8?B?M2FZMTlSdC9wcVlZdzhxMEJxY05yUVBqOE5kYXJwRGp1NWl2VlM1R2FLanEw?=
 =?utf-8?B?bmtabGwyMGxHT3hXVE9vdXJOVmNiUm1NbGlpVGFpWm9PckQxNDVOVnFmTlB3?=
 =?utf-8?B?S1ZpWEpYbE9aTVB4dkVIZ1lheGI1VlpoTHo3bG9CbVNqMWpZMnNKTzBFdnpa?=
 =?utf-8?B?ZkdpWHhmZWI4Vk5YZ2VXTW5nVGdBbzZHQUlaNjZUdlUyWUVkK1F6TGY4cU9s?=
 =?utf-8?B?bHpQU0FDb2Q3ZGl3bjNSMS81ZWY5K3l2Q0VNSENJck00S0g4Z2RCaXRJVkRJ?=
 =?utf-8?B?aytqWWcyenUvdWVpVkxsRnl2UksyWlZLNTc5QnMyREd2MGVQK05wTjVXc1lZ?=
 =?utf-8?B?WTN2M2x0dzZJeXFWWHVPMDdOcE5CZFV6dkE2SnVkeE1WeXgvcnhLL0EwMHJj?=
 =?utf-8?B?WCtoMkFIUUloN0hMRSswcGVQSkxSd3hzTmI2ejdLZzZwNGV3MDNXdVNmVzRi?=
 =?utf-8?B?bkJqM3R3Q0ZFdVdvWTNEZ3lVVzQ1akprMjNQeDlXZ25LSVFNd1BsU0djU3hZ?=
 =?utf-8?B?REl6UEo3dlJkMTRRZ0xrWDlvMXRCcUV5ZkZGSFFWSDFlcThDQWNZZ1l6RHpU?=
 =?utf-8?B?WkY4WVZBVTBmVUgzazZFaGM1SjdLN1ZiTWtPZU54cExLSElRZ0tQb01FbStL?=
 =?utf-8?B?VjN1ek1yTkFMTjdicmRnZnUrdUpDdExuZXljOE9HUUU5cnpCak53Rk4zeXho?=
 =?utf-8?B?TmRKNUphY3FwLzUzNXlUdHVLQ3RMeWQ5dmVpeXJvbUdJY1VtajI0N2xyWlpi?=
 =?utf-8?B?NlRnSjNUSzJLNVBBM0JOWnprMnQ0aDB1Rk10STNiYUIvZlN1Mk5BUmtkcW5w?=
 =?utf-8?B?ZStSQ0h6ZkhtQVYxODBiU3lqRG9RQzQ2SSthNDhab1RkU1pQV0JZLzBKbEg2?=
 =?utf-8?B?T1BLSlM0NzAyL2Z6UCtiRVVXVnZmKzRhNitLYXNnQXE5RXUraksxRjVTZ1FT?=
 =?utf-8?B?VFNlQ2tEOG54dnFSeDlPZnV0b1JwWHE4Wk9VSXErYllqeHNMTnYzcGhOWkxq?=
 =?utf-8?B?MzNBQnVHRXpSMFhhckxFM0NvQ3BiMGlNMWFLZW4wSW9ZbWVhelkrRUpPUDRM?=
 =?utf-8?B?L1JVVW5lYml0YzlOTFpFYW9pcGc1TzhjNFRPY2cvMkZGc01keW05ZVlaR1gx?=
 =?utf-8?B?V3hoK0ZlUG1odU5NTVB6anVmelovWTdTZVduWWV2SXdKNlFxQTlIQ1E1aGFG?=
 =?utf-8?B?ZmdzRVA0RTk1NzRscnFFOWhRTk1hYnV5aEkzaU1KS0dvZDE4ZkdVcW1PTy9H?=
 =?utf-8?B?ZGE2UEFiOXNHbjh1TE9KMUlCRk5CeGhyUVZuS1RaS2tTL0k2MWFQS3cyeFNW?=
 =?utf-8?B?Q01rKzNwdm1HbDErbmdzS2UzY1BKSlV3Z1cwVS9vczFBTytSeTBCYXlRWDNh?=
 =?utf-8?B?TDY1cUpPVkg3ZVlxTG9kMDM1eG9odXRIeXFOcmlaTE04VmJOQTQxWENEcXhx?=
 =?utf-8?B?N3ViZ21PQkVuQ3JsWHZPSlA0aDdrRE5HMG5RWURieERpd3Z5T0E2K21URW1T?=
 =?utf-8?B?aUh3M2JYcmZZbnJPblNXWnhoSmUrQmdTZk4wQW82di9OdEJWOVVFZjhOU2N2?=
 =?utf-8?B?cEhuZ1RnSjhCRUJsb3hlYm8yZXZnZWNzK21UYUtZRzBreitNUzRpOXI1QXhs?=
 =?utf-8?B?V212Z3llbzU3dWV3dURYNS9DaTZpVGJmRFlId3FzWnRWMC9iZXg1Yk9GNmVZ?=
 =?utf-8?B?YUdYMHZXS2xOZXNTWmI3QldkODJjVk1EeU1rSUd3SnV0aEMrRG1ydU9abjUv?=
 =?utf-8?B?aHV4N0ZkS25XcmR0NXh6Rkg2S1VabUlJK3VCZFZpZ0h3eHlqaVM0L1NUMVBT?=
 =?utf-8?B?SFBpaGpabHoyM3RyWFJicnVaMVJTSzc1SDVkbkFSVXFUbnJtVFhMRTM0a0M3?=
 =?utf-8?B?WlJUZjJEWXpmUmRpenVzZ2hNZ2w1RFVWM21nSHcvWnJQTExEVjJzOVArZ2tr?=
 =?utf-8?Q?wWIG8LwhSJ0mkSYq/TxjQBNQBG3t1pkRLx+h8a+Jb6bum?=
X-MS-Exchange-AntiSpam-MessageData-1: B2P7qSQ2iathLQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d16fff-6744-467f-3dee-08dec785a805
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 06:50:00.0508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /p7zV9lk2YzD5e3I510viygXtmi5pIB+GlAREd2UG1BJxJWUMn0crIdBpECe1ILsQH/li3MQ7ixZ0c37y6NI3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4444

On Thu Jun 11, 2026 at 2:49 AM JST, Timur Tabi wrote:
> Add request_into_buf(), a Rust wrapper around the
> request_firmware_into_buf() function. This variant loads the firmware
> image directly into a caller-provided buffer rather than a
> kernel-allocated one.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/firmware.rs | 45 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> index 71168d8004e2..d2ffaacc2d43 100644
> --- a/rust/kernel/firmware.rs
> +++ b/rust/kernel/firmware.rs
> @@ -120,6 +120,51 @@ fn drop(&mut self) {
>      }
>  }
> =20
> +/// Load firmware directly into the caller-provided `buf`.
> +///
> +/// On success the firmware image has been copied into `buf`; the number=
 of bytes
> +/// written is returned. The caller accesses the data through `buf` itse=
lf.
> +/// See also `bindings::request_firmware_into_buf`.
> +///
> +/// This is intentionally a stand-alone function rather than a `Firmware=
` constructor. For
> +/// the `into_buf` path, the firmware data lives in the caller's `buf`, =
not in a
> +/// kernel-owned buffer, so returning a `Firmware` would expose `Firmwar=
e::data()` as an
> +/// alias of `buf`. Since `buf` is `&mut [u8]` and the returned handle d=
oes not borrow it,
> +/// the caller could mutate `buf` while reads via `data()` are outstandi=
ng (and
> +/// `release_firmware()` does not free `buf` anyway). Releasing the book=
keeping here and
> +/// returning only the size leaves `buf` as the single owner and accesso=
r of the data.
> +pub fn request_into_buf(name: &CStr, dev: &Device, buf: &mut [u8]) -> Re=
sult<usize> {

By adding a lifetime parameter you can return a `Result<&'a mut [u8]>`.
This is more sound as the caller cannot use the unwritten part of `buf`.
It is also more convenient as there is now no need to create a sub-slice
manually.
