Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011037.outbound.protection.outlook.com [52.101.57.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9CA358384
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 04:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153929; cv=fail; b=iXsiNCdHsgqZxIlnDkL5A0ouCqBUzSTOvjca2tul6c5rNrPQhJtgLj9Pm+TjmAEattDk60jfFK3lliPog0/2R3OM8ZtsvfAzi0S5mWnCftMm7KcusZGlxRpa7x/xxo1Qph2Ndr+tI0BxvYW+UwElkqakNWU3GTBOUFpDMw1CiNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153929; c=relaxed/simple;
	bh=Epg+Gb3TdjXh9bLZO8/9kfVlSpSc3jizmPC433dLnoE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=mih+XddaZSH35x0zypb0Iurlc933qwR48/YSLIImU6Dz/rlsyTAubB1gAt7yyFEC70HXga20vt9HF/+CYCAthjDAN1ub6NXuDHzTENVPpaz2fqreYhZUD44IEMvnKLyT9LUVtY58+nrIyLZRpd6vUlavd+rrtDmdbVKS/2lybFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WQ4FXBp+; arc=fail smtp.client-ip=52.101.57.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WQ4FXBp+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITVlleL0r/AJFHr60tTMUopXfxbDZluG56JCH3bVUQKflmERGnf5Uicf3urldL8Djbu3gWXOj6U13VQKWfjnCgoTtaxw3Yjh1UibeExpKFpxh4B0nsFtpsMFzXUtCSXUp8ocSt1YXu0cKjdKtmSu1ejuyGIgWjs4YO2nDjZhr4VRWlm6vYjr0REROeKP/PTj6iWXUEPR2go88aGZqKR00Kqz3x/ZFTgQOQ4FMb/Rp3d/p6JrfU/IeoiORzc9DlPn/1lLjJtpyvyIsR16c3LrfXv9wswW5Tm/YlvvA5XLCl8RaTzUXL3zN+8lkZ0RXtZOaoqa1ZxLKtnBpfElMKh1/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tsvdp8FBp086sTUCHem/XbB1P2FJRwoyOFg1nN3LSPM=;
 b=Q5AHAshaPoy36QAznXYdIs/rm1BdwnQOZ0P6I3Ga8Q4UFI0HzmLG5KZlrmo6iiJKZH6DrJX0BYO4n/8rS5eqADg+B9Oh5NbqlnFW6C4rclw7LyrFXmPy8adCqcH833HOKtYsDnu2jM0eIi8Ud22nco3BAbnuk4GPXGdKMpCqp746UGts2mCUxb0fba6AkYL5HZowZXStrVLGze77ZK2jht4wm/EGlWRm3L/+ZDJslQzmN7vZkMCJNaWLuKey0lcxbVC7kkxUjlloIN9vyqp4WzK+BQD4PjC4oFXGk1vDQAbHaELPL0dpFUFjwTXZZO/bqSFhgqbRatIDgKUK6tGSEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tsvdp8FBp086sTUCHem/XbB1P2FJRwoyOFg1nN3LSPM=;
 b=WQ4FXBp+XuodCJl45VlwZvPIbbWr8mDMJSjxvtLGzWwI0Li7yoxVK4uiCDHrUu7RNQwRoa/I0yJV8uKlkXCEPZVDZYtZB68Nd38flnMJKQ3Kiciew4DgIZlvVjjKaUbNgEGvVbVBBNYMlAcbyE8DDv5ar/RiqEmIGDdeU+K6hLm1B9XpPX92Z3S4ejc310HhChZr9ZXARjD77uCI4/1dDTa0i2NSEnPp3I4BBaThoXkNi4e+vEQcqg3c48agVP3SW/Ydr0UbMvzIXscyjSoJ89xHi2PtNVxbYOGD5etBj8JNnFR30tUKHIL4ynNfXYw/eujC6VxwVCP9GamT+61OSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by PH8PR12MB6770.namprd12.prod.outlook.com (2603:10b6:510:1c5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Thu, 11 Jun
 2026 04:58:34 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf%6]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 04:58:34 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 13:58:28 +0900
Message-Id: <DJ5YD5P8SRF3.3FFZWZR1F8Z02@nvidia.com>
Cc: "gary@garyguo.net" <gary@garyguo.net>, "nova-gpu@lists.linux.dev"
 <nova-gpu@lists.linux.dev>, "dakr@kernel.org" <dakr@kernel.org>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>
Subject: Re: [PATCH 1/8] rust: firmware: add request_into_buf()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-2-ttabi@nvidia.com>
 <DJ5KFI6X3U8A.1TFKQTCR63RPI@garyguo.net>
 <68142d2b64917b18257d092ec0e8bb0ade3bf4e9.camel@nvidia.com>
In-Reply-To: <68142d2b64917b18257d092ec0e8bb0ade3bf4e9.camel@nvidia.com>
X-ClientProxiedBy: TYCP286CA0286.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|PH8PR12MB6770:EE_
X-MS-Office365-Filtering-Correlation-Id: 627d9023-8a8e-47cc-4061-08dec7761661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10070799003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	c3JDcAL5781JsMwmFiZm+ILG6Jjt1VS0U7wTCJr7tlGn8Sb8vWw75D/grQVMtEltwCuuZI4LhSAk57gZvQXey+5DY5/OXZcKOm4o8l3ByJFt8mqUbVnudgnLtgkB6xyg3gLVo5spWicLd7t3bbKkFpWfvEm4iFEGlkY3IXlcI6CpfiiN3NJ8u2cvSuqH1+p57ArqNshG0Set6e1D9gGXKbmg/EU17PXPDPwpvPXx98P16KFcbqhP2wF8hXO4Fu8asD4MkxqOjX3blncftowQEMBntYRKT55N9SnpvTHts/MUttDRNrROHD+nSBOHEMQ3C2hX3jB/+6D7E/ggXqUwZKaezm18gxgUxOf7XPLxQxeqPLDFcC2LbzSrlFQ4RPMP5nJf2nZ5QvSr6HvJk5ChWcMPDigoxuGbuliHm0im0NY+I9khvtK2Rkb69IB+eje0hCXR2Z9T7M/JVTmD6136tSlgoblleLcvVqDgXHRzgbWZGK3Dy/nB8Chi1N0zBzyYXYq1lXB9Hb4aduMV8XISQZ0nBkQA0g2BuCcjEvUhlAtFuBtJsIHcF3LauKtHwuETQzJCi+Ld8IdC+y1dBdPqd689SyEECQZzkOKBURvn4VkEeZhNlrcTRM4YNeRVWXFDcARbiR9Sl1pYtb+RLbvhKZhzsW3g+gKcz8UJGG2K+xbt9V/JNjRyWCko5K9215At
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10070799003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTJ1SFRzWXk3cGZwZk0ydVZWazNySVFaeFJIaitDdm5HTktub2o1ckFlcklh?=
 =?utf-8?B?Z2tmZW5PSHcvdU9QbWg3T0thaXc0c0gwYWhBdmxWOWZoNkRPWFYwSGNuTlVI?=
 =?utf-8?B?S3lFcURyQWJhRFZLYTRhRkVXWllSckx0TmF4MU5WRU9BVmxYMDdKc2RRYjB4?=
 =?utf-8?B?OWJnZk9sdUlhV21BcnprWVZwNHBnZGxsTXY0SVJFYyszMitmelJaUE5TRjc4?=
 =?utf-8?B?ZDlEbzV1QjFKc3VjckhHOEJqYUpYckZ5RUFnY2dNSkEweWwxR0lNM0xTTnBj?=
 =?utf-8?B?dmdHY0hhYzMvOUdnaXdiSUNDUnVzMDh1azRTL0dDUnNJdjVWNzlaLzQyZFlP?=
 =?utf-8?B?dGtTRWpEWXZRRjJOc3o5TkJtYW0rZnR2ZUdLa1haV1dndWhCREd1bXpFM3Fo?=
 =?utf-8?B?TkIxTnlPbTl1ai9DM2puaWZnd3dPdjV3aVp3ZHZLSTQ4Q2FlN2FJbjFOYjh2?=
 =?utf-8?B?QnRNMmlBaW9SZXQ4aDJuakhVVFZCbEZxNzRNaFZsRW9Da1MwMSs2ckxNeVRN?=
 =?utf-8?B?YnAwN045OURCS0JjU1IvZVpaQUd2N3V0WjdEODRJa3ZxNU1BMUFwdHNXdDNH?=
 =?utf-8?B?ZTV2bnJHb2ZJL0hqUDFjMWdYWm1WcnIwS2V6WjdVKyswZHlWTnFoZHlqbUoy?=
 =?utf-8?B?RU1BRjRFbit0UG9MMkZNd0NHcjQxR0VZWlJSUW02NE5kYnlHOEUrdXprenNU?=
 =?utf-8?B?NEFtQjRQV0ZUZXZJTFBOR1pQOWpXU2E3a2NsbHdFNUNhODMrNUUzM3ZrVm56?=
 =?utf-8?B?RWVqeWtxdDVJMEVaaEt5RU4zRXZGdC9oenhqNnJrRW83ZlpDaElOTUNNTVIw?=
 =?utf-8?B?bTJTTU9jejJrbCtDU0UvWHBYNWtTWXZtQXlRVXhKd0FRcW14K2djZjBOaktK?=
 =?utf-8?B?SldGRE9JNkpqYVliRFgvQkRXODVnWGJxY0V1SWtaK2g0a28wV1cxam1CcXRR?=
 =?utf-8?B?TnUvdW9xSmhjZTQ0dk5teHdONnhmaDZHSWdjcndtdnZJL3RUbFQ2L0t2eFIv?=
 =?utf-8?B?Nnpuc1RSYWYzUEZtK0NjZ05IamdXYVg3SHhpakgzV0duNTBFVTlZd015dlJO?=
 =?utf-8?B?QzVhcGd2RVBWSDJMY0twbFUrdlNnczlxV1cwdnpmRFN0cWtvZXozTzUrTEor?=
 =?utf-8?B?RGpFSlhxQ0h5WWxsRk12clF2Skt0RjY4dEswMVcyV2k1R1hJYXVRVWtWamlD?=
 =?utf-8?B?L2lxeldROXkxcDl3a3J4Tk9OOVJQWExsamlrdlEvR3V1NzEvSjc5QXF5RzRq?=
 =?utf-8?B?blJlUjlOVG9SUkNEb29HRUFseW5JZlBXakZqN3hoVDR6VFlhN2VuM2I5N1pQ?=
 =?utf-8?B?d2hLUDkyMlRjWnVpaDVrNFpTeWFTeHlTTjhaMEVkRDdrUW9WZ2Z3b1NmS3JR?=
 =?utf-8?B?WXc1N2dLM0xYaTRwK2xrV3doYVFFejVkM01YNkxuWldmUVhnVkJTcGtaZXRO?=
 =?utf-8?B?U1h0bXd1dGpoSzB1ZW9BUWp5S0xyeUNLMU5wdnVJV0FBaUFrWTdGZlFSVDZ2?=
 =?utf-8?B?NUdENHZxbmZucWM2WFJDRS9RQy93eXJiSU54RWJzYXFFYVpzYmdyZzlRVmZS?=
 =?utf-8?B?QzJ1NDB2eGtnZnNjalFMSkpHa1JyOUZacEMyNlRYZUtRa3ZOYm9jVEZXWFNp?=
 =?utf-8?B?OGk2WEswSTY0SWpwemptd1FYTUU5aFNVVHhaKzIveWJGVzRWMjJabmVhazNK?=
 =?utf-8?B?SGkyV1I3aDlxMmZuV0xBOGc1ZWVWS3Jwbmg1VFpabDVXMHErQVNEZHNXbUla?=
 =?utf-8?B?S08vVlgzZHBkTzhaZXpjQzc0Y2EyUjhDL0xHUkhRZUxRQU9KQUk5a0RmdCtu?=
 =?utf-8?B?ckRVVEhQbGc5blpNOGY2N2lUbmtoMDNjZnkvRXhGd2JIdlRJSnRRZjExVi9m?=
 =?utf-8?B?dHhYWmhoR1p4RUYzaUhHV0hhN3k4WkdSZGk0dXRINEVid21qYWJQUDFCaTVB?=
 =?utf-8?B?MFd2SEszUmkwNjcyR1ZMcTNsdVF3ekhkeDJtY083cWw1ampEcDZjd3d5a0xY?=
 =?utf-8?B?L2lmczNPSzJwSkYzMElKNjA2b0p2aVpiZ1RieWJ1QnBSUHhIWVBoMkZMSHdF?=
 =?utf-8?B?bXNERGZ5d29uMXV4Tk1aNFVmYTZOWVphbXY1MWN1VksweVI4OVg3WFI3bXdm?=
 =?utf-8?B?V2JlZlM4VUp6K2hjMG9KbldZSWtleXkrMDhzd05yVVpXS0I3K2JsUkhzUjZ2?=
 =?utf-8?B?aC80YkNCTHE5YlFSSmtjMmhTOTdFNk9XWUdKaHNXTkNOWGZ6R3FkRW1ybXdM?=
 =?utf-8?B?b1ZjQXUrWGZQZWUyT1BmdmlENUhwdHI5WDhnNlBmbTRkOGpSQWsvYWthKzVS?=
 =?utf-8?B?Wk9LWDZZV1NxeDI1eklId3FSYnBvZ1lyaGZYbkZrTW04ZU5Vc1J4M29JMmFQ?=
 =?utf-8?Q?GFxIPApdcI7H5+8YXt7BZABFM20nOsxkU/VLIPps6m3DE?=
X-MS-Exchange-AntiSpam-MessageData-1: nzGOw151R+FGYQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 627d9023-8a8e-47cc-4061-08dec7761661
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 04:58:34.0718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZx441eNfxYHxkFa+ruol+PByDKlLaLsUNPR3mfBZFewdhYwjaVe6Z63hSsp5akJXh/dySAZMkj3j1NVdOuqeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6770

On Thu Jun 11, 2026 at 3:24 AM JST, Timur Tabi wrote:
> On Wed, 2026-06-10 at 19:03 +0100, Gary Guo wrote:
>> > +pub fn request_into_buf(name: &CStr, dev: &Device, buf: &mut [u8]) ->=
 Result<usize> {
>>=20
>> It looks like this API design is very prone to misuse. Patch 5 of this s=
eries
>> for example does not check for the returned size.
>
> I was debating changing it to use request_partial_firmware_into_buf, whic=
h would "encourage" users
> to verify the return value.
>
>> Also, I think people might just write `buf[..size]` and then it'll panic=
 because
>> `size` can be larger.
>
> Why would it panic if the buffer is larger than the size of the file? =C2=
=A0The kernel API requires you
> to know the size of the file before using request_firmware_into_buf().=C2=
=A0If the file on disk is larger
> than the buffer, the kernel returns -EFBIG.  If the file on this is small=
er, then it is loader
> completely and the returned Result<usize> is the number of bytes actually=
 loaded from disk.
>
> This has always been a problem for Nouveau because the GSP binary is 90MB=
 in size, and
> request_firmware() allocates a contiguous block of memory for it, only fo=
r us to memcpy it to a
> vmalloc'd buffer.

IIUC `request_firmware` allocates its memory using `vmalloc`. Unless the
firmware is built-in, in which case it returns a pointer to its
location in `.rodata`. That last option is probably the reason for the
unconditional copy in Nouveau.
