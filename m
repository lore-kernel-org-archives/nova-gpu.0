Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011047.outbound.protection.outlook.com [52.101.62.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AFD514766
	for <nova-gpu@lists.linux.dev>; Thu,  1 Oct 2026 14:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863650; cv=fail; b=dWRBWx1PN6H9mkZ6+tebeUwPSQ8ewf7L8b06IpPj09RBxJV9UENsczo7CjaFLuWICJIl4NYxAahy/YzsszeKPQHqoSPnga6WOF9abLGKv7ovUi7NT4bRFE/eECZslQNJnerlv/FGRXBYBS/8njbm+wcNdG2Bv/Etv0RZyk7dwwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863650; c=relaxed/simple;
	bh=Y74UbFmJqwcXCTWoT8lo7wQ8FinB+OJy6EY8jUdNwJo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=du+C963UjSNvr2WR+V4GUfR6AElxfnZmQAazWAmt+A5kPcdc392wmSJl3Mc9kb3G/M2d5XqEsoyCMy37ES2oiAhTe6c66+Nz/GZBYuyKeBvSKk9O3VJN9T6Gl5fEipnzKxH36/0AYRif52L3RRGrYvFT2bXdoPOn9tgP5tKQww0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aHI1YMOh; arc=fail smtp.client-ip=52.101.62.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aHI1YMOh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANhA6PktqPMonIy8JiQXgWrJfd5F1MMAj8veQDBbpuqdS64FTP1KflHFzAiXGbqWCx8WcdHQ3vcwJVlfUoc0IDgxG7e4a4puYgMDqLbQ5i7RnSNNYpb9788PUvmiEkLiRFyJrNvkzmdT0r/XaMbHUGFqNUJVWs02Uo0iTGU6Ikp+/bw7Z+kunKjV2B39tWAdOwdq2sIDlmhkweHexr/1Etww1HI4qCWpV0f6OR3BRaEUcf3m90PW4Vc9ySLI1E9KOE8d9SMJnwkJbZK0c7VjOPezBAk38Cc8x+8QRGHFMXAq9P+S0Cym7aGoj+HzKpmzr2YNFk1FA2ru/tOgU+lSYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5S7Xx9Ij33K9tFe+58EPN0bg15FVtYP8LNXNwe00Js=;
 b=isOSqRpdx4GGitxXVpSUexuZvJBlg20GH1mtptKFO2RGuKKlZmeGY56zxab+u5bkInuVLRNrFzGzlgsTXG0vU2LJhUtOIwJOXwca9eEhASI4QCU8jNoNhYqgvF9JIA3+HTGDr1DvN6HEdGZ+IxvIfEgXW6ofCn+RrgAmCF0lBKcvs8tp/tgaVgYKB06e4LIXx4utXI6noa3qWjXiOkt5gHQ2SUvhM7lvLuouNGD1Z3r3xLvS5yvhM1SqDQBmnCkRvlrJ0J5FMeXZlAqZZ6wxFWlZpiOZYI9Ik95c2pCO2HksTBxBpdTdyMhOLR7Tm04BakLDmk+LN1LQKhFcXA/JXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5S7Xx9Ij33K9tFe+58EPN0bg15FVtYP8LNXNwe00Js=;
 b=aHI1YMOh+PqSG25lvCleyJsgai28oKCQ3kIpaGVaYQVr8hTIFr6zm3b4AYo334XVyHez/kiu6baTV5TSdGXE3sE2HnLXAU3e6M4BIEyA5ovTX/qt98btRIyw76dawEMiXa6i5/wqcVAZz/2qPCZCdPfHYMe3iEfTTpypLHUZKmcFG9ArJZQtRhzBpOa5jCICDFe7Z4ClHqDYIe36RvaO8ZXIvIg8CIXijrQBD0cWhVMlaPhJbOBAO6+27C7BbP5MXrKG6IyDlTWwJGzmadoeIw/twCNSrzka7Q4g+yJ92ZZq6h2If8lL46ik+sFMr5/1YsnNT+xB+ADvlE2Xj04ypw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DM6PR12MB4298.namprd12.prod.outlook.com (2603:10b6:5:21e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 14:07:20 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 14:07:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 23:07:14 +0900
Message-Id: <DLTK6C7SSTNU.UN1TUP11FS1K@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
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
Subject: Re: [PATCH v5 07/15] gpu: nova-core: wait for GFW boot in probe,
 not in the Gpu constructor
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
 <20260930034148.590687-8-jhubbard@nvidia.com>
 <DLSNXUU1UXIH.JG4L0L5ZFV89@kernel.org>
In-Reply-To: <DLSNXUU1UXIH.JG4L0L5ZFV89@kernel.org>
X-ClientProxiedBy: TYCP286CA0117.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::15) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DM6PR12MB4298:EE_
X-MS-Office365-Filtering-Correlation-Id: 78f4fd96-8c82-466f-85ca-08df1fc54d0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|23010399003|376014|7416014|1800799024|18002099003|22082099003|4143699003|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	UtluU567KJoBI7qLtIi7Xvq1PyVTqWiSqEofUAQhRWUafsUpLTd0+HyMqKSmDDTFlXpNn26h4LvjGDb2E2lxJXmFuVWUqiymQQCdqvjynTlvMUA1BEn4G+W+K/X0A6dMo9v20XIVmXyf2r9V4FUwXwk3G2yDa7jEVAIGu4B/jlKjBMpmG6nLYA8UwZ467mbqrwfG6VzPps41/PeEEY4FX6brVk4TgQbdKCZTFeF4HSW+qNumNLlB0OW6BhyHXyrQKTdivWy03hqU8l/YuMUojevzh+kzGkKumwDvsuAW2Vb3C/yhaylR8ArLXh9YsoN2pDILJmBA4makpDHlNMk/pzEQdF9jqfddEc8m6QA4bBZD2kpHmXuxluOqU6BMMSNCXjc27elTCkKKgwtPiaRBeUOj8GWCkl2GmPh5D500YyjT3it91CAu5N6ynOXtCFjdupYQgiFWrZT1muH7BSUGFv7GwfmJ2qe7kdFJACLCPhUci/U7TeSKFh/eaAKA+dhVcOunvYD/QG1CPGdXaT/1uq3CXcb+16LQrppeOxECN/UQb5w31jbj2o1BlngWWQM1gTAhfE44SlyXJeah49vAHN5a1Jm8vpHMjq6v5Zg13KezwiPDYIdpGjW7S7HSjxCUFaj4OoJQ27QCchL4H7yoqVbDYbW5K3CkaJoLmuP4YuY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(376014)(7416014)(1800799024)(18002099003)(22082099003)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlQxU21GdUppYzcwdU1jZTh3YWtaYllVQ3libFRONm85QnBmT3JqRE4yenJH?=
 =?utf-8?B?VmJ5QnRIYXR0M3RZOEhZbEl3a05qY1pYdndUbXB1amNVdXEvSVVHWDJnSWNM?=
 =?utf-8?B?T2c5dnJudCtGSSsyK2xpaTByWTV1MDBRclpqUWlwUmpGbThsZk1NZUtOanJE?=
 =?utf-8?B?S284d25iWUZmQmFvZXBsSU5mUHUwQUNMYXViV1VNSjJhc0o0eGNaUVg3QWo3?=
 =?utf-8?B?NXRKOU9zcmRENGRCdGF6anJDYUlsVldyMTBvWEN4NjRCRG4zSlVLVUptcVV6?=
 =?utf-8?B?WktFRFd0bzI2c1BRckQ3cDB4c1UxcC9Ucy9nY1MxS1o5V3lqU1ZyaUtNMjI2?=
 =?utf-8?B?UnJWSG5GZFk3M0JBQ3dqWTROT080K2VNYjlJYUpIMElXL0VtRzRSckdnSVBB?=
 =?utf-8?B?dlFmQUMraWdqeU9Xbk9KQ2k0SkNzbmZaTjNLL3pWL2drYWltN2I1NjNTMzdj?=
 =?utf-8?B?Z0phaGJ3LzdRa2pGRmlXODIvSXNZdmxTbUUxRnVBL0hoYWVTWDVMeVZMNHJN?=
 =?utf-8?B?d2Zmd1NDd2pUc1Z5OGhNRjZWNW5YL3VJN2JvVWV3SWo5Z29OOWpyWjQ4S0Fy?=
 =?utf-8?B?cmttSmFoTWlWOWVYcVg0cUNUY3FlZS9WM2Q1b0grc0dDUmwzaGNEeXBKcEw0?=
 =?utf-8?B?L3RWakdNRW9EcWJuZTlFTk04N0VRWm5IclVCcmI1c2NyUUdENG83UUo0NTE5?=
 =?utf-8?B?QmtpQWt6NDAxMlBxZ0s5K0xkanNZZzZucUx5QURsdXJVRUxjeFNZcU5td2pa?=
 =?utf-8?B?NTJGQmhTK1ZVbWswVUxQT2traDJDKzBlTjA2YXcza05RUzMyM1JVU2lZbEpy?=
 =?utf-8?B?bTBSbWFKN2dWaVVTdzZydERHS2JaZHVvNnlYbHphZW1VeUs2Mm1tcjQ3L1B3?=
 =?utf-8?B?aEhCTTBHUzN1SWQyeWZHb0NTYitRcUErV3dqelJrUVZBRzhoM29pbklIcEZD?=
 =?utf-8?B?R2NoN3pzZGRaT3pqdzVCdlphTW1sL0ZqWFpHSWFYMjByc09EdGVXRlpXWlF0?=
 =?utf-8?B?U24wemdYd1Brd1dhUlJkaWhJYkhOeGJ0NVErS2tGcjNuaXgxQ3hBQ0t2U3Zw?=
 =?utf-8?B?cFFTeDZhSWdIYVAxRUhOWHJ3em8reHVYSC9FYVVubHZQWlZXWTZUOWNpdXZD?=
 =?utf-8?B?cEFLenZFdDdOeDVFSDE5WmtCK0NXemJ0MnhRUGI3VE9qQkEzSG4xajNaT21N?=
 =?utf-8?B?UEcrOWpYREM3bFFIeG1VcXRVNzlOcXZGelZZaXg0QzJJZGJqMVl6OW4xdTRq?=
 =?utf-8?B?dktrL3YxS3IrOVJ4VEJrR0N2ZVFYNjZPVThreU4xbW9JS1BOaUN2aFpZTTZ3?=
 =?utf-8?B?bmxaVU8xTmZuaDRZVDRUZ0w0aG03c2Y3TlJ5OTg0N1pJYzl5QkVuT3VWaVp3?=
 =?utf-8?B?RDhGaWZTM3l4dE1mNGlFeFg1THZ2UkhLTVI1WkFnVDZubktyZUkvZjBHZENR?=
 =?utf-8?B?YlU2UXpxMXBDR3IzQXJlY2F3RkZPc3FLcnE1T0t6a2NXcUlGOHJNME9WZFZK?=
 =?utf-8?B?ZkhJWkQ2VkozcFBUc2RmQnVVbXNmMFV0NmdKS2srOWltTW0vcVVza2xFdExw?=
 =?utf-8?B?cjl2bFFuWldjc0QyRnFmKzk0Mk5pMWttWXBoNEhPTE5WUXRHUE9uQ1dyM29M?=
 =?utf-8?B?akhHUWdrVFVWUEhUclR6Q05GQ0ZIb1hHdGo5U3FaZkw0aktmSlZlMVVBd1JY?=
 =?utf-8?B?eXFVZnJ6VngvVGVkeFZCZVdrQWFMT2NkNm44K1hIWjRmT3J4Y1JjeS9leHRL?=
 =?utf-8?B?eG5XaUkwZ2NnamRST3F5WVpBdWZPeGE0bHRWM204aE9QNThCVlZydm1mZ0sv?=
 =?utf-8?B?ZWVNVHhYY0liMkh3Vk9PbVBncEV4TGFNaXBWZWtyTG9kbG9BUUdoeW5hWXJI?=
 =?utf-8?B?UDIzLzBGVC9id1BhVytpeGtrUzZPTkRoY25vOTRockZHSkxYb2hzQ25zdEdx?=
 =?utf-8?B?VnRVTDVhL0QvZ294bEJ6QUkrazZGMnhxc0h0U3VvUjJ3RC9IQk1Hc1IxMk9X?=
 =?utf-8?B?QUVIdDZBSkg3UGFCQWZwMnMxQjBjbitHYjZ6Z1M4VnRBRzVaZzJJUEpGa3NI?=
 =?utf-8?B?c0VXMWo0NXNqZytDWnhFRDNHL0hlbjZtY3VPTnd5Nisyc2taQzRKK2pvS3Rm?=
 =?utf-8?B?d1M0WmhaenF3YlpwWXZFdnV5eHJKMG1TSDFVTFJhdzUvRnlHYTFBcm80R0dr?=
 =?utf-8?B?K0l0M08yRXR2K1FROW5sZXNxbWtRWFlGUWQzVnBJU0RabGxmL1lqS3FzdmVS?=
 =?utf-8?B?U1Nya3luVlZWNWhRTEZZMGI5YXVOdElMRHlmSnpDUmptcTN5MjM1clk2Vkd5?=
 =?utf-8?B?VUp3UC95MWRjMFNwekVMMFBNK1VJUG90N3NFUk9WMTdtaUVyamI3dXQ3cUc5?=
 =?utf-8?Q?S70EVsTOECKNqrfbeC2S1+ZEV7EuHos4l2OyPtX60b5kx?=
X-MS-Exchange-AntiSpam-MessageData-1: 6R898f4OTIkjeg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f4fd96-8c82-466f-85ca-08df1fc54d0d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 14:07:17.4015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8sc6EM17r2GeZuptCO5PhpaDZZL9ZawFND/gGRGO13cFY6p0DsDIJh0lCfzAFKZd2EJNCk+3Rz+vBnDzS5uDcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4298

On Wed Sep 30, 2026 at 9:51 PM JST, Danilo Krummrich wrote:
> On Wed Sep 30, 2026 at 5:41 AM CEST, John Hubbard wrote:
>> @@ -113,6 +117,14 @@ fn probe<'bound>(
>>                  pdev.iomap_region(bar1_idx, c"nova-core/bar1")?
>>              },
>> =20
>> +            _: {
>> +                let spec =3D Spec::new(pdev.as_ref(), bar)?;
>> +
>> +                // We must wait for GFW_BOOT completion before doing an=
y significant setup on
>> +                // the GPU.
>> +                gpu::wait_gfw_boot_completion(pdev.as_ref(), bar, spec.=
chipset)?;
>> +            },
>
> So, apparently this is done in order to be able to add this
>
> 	#[cfg(CONFIG_NOVA_CORE_SELFTESTS)]
> 	crate::irq::doorbell_test::run_selftest(pdev, bar, spec.chipset)?;
>
> in a subsequent patch.
>
> I prefer to make wait_gfw_boot_completion() an associated function of Gpu=
, keep
> it called from Gpu::new() and guard the whole block with
> #[cfg(CONFIG_NOVA_CORE_SELFTESTS)], such that eventually it becomes:
>
> 	#[cfg(CONFIG_NOVA_CORE_SELFTESTS)]
> 	_: {
> 	    let spec =3D Spec::new(pdev.as_ref(), bar)?;
> =09
> 	    Gpu::wait_gfw_boot_completion(pdev.as_ref(), bar, spec.chipset)?;
>
> 	    irq::doorbell_test::run_selftest(pdev, bar, spec.chipset)?;
> 	},
>
> With this Gpu::new() remains self-contained and we don't build up corss
> initialization dependencies.

Indeed, this is architecturally more solid. I can apply the change upon
pushing.
