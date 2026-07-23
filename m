Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012027.outbound.protection.outlook.com [40.93.195.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFADC324B1F
	for <nova-gpu@lists.linux.dev>; Thu, 23 Jul 2026 03:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784779179; cv=fail; b=jq1l/SertVnewe8wE8IyTLKM5Jb4NtWOC7hnVX/jzg8MheCFdQYfy6x2usW2wu3eNlDz2cOXzz0t0crjkSRnhd0WbP3P7gKzzFK/Qb0GXyemHPhSrAZNoJmyF7rgomzPni7sF8wI8LJjY7JqhUM/CMI5kW/eb020ugg3mbReuOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784779179; c=relaxed/simple;
	bh=KJT8VOqHE+hj/DuKk+ZAoO9nnfFPM+SB8+Sh4rn394w=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=dc1fbDEkJAa+HJf1fmB24+7OyN8U+zNqcUWOanjBO9CwsV77v2dBehvDBZuaRdart/7pL35IzbU9jgVPucFV+69SUZ99OmqKUHwGcIELi2I+MoHtDX/JHqYsmQOH9HRO42X+RqgwZikhpP1NpMNJ4REY/ntZyobdzYPfegWbTNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ls8/tS0B; arc=fail smtp.client-ip=40.93.195.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ls8/tS0B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRSbZZR+mglDY3XWQrgc2RVtyEMQ4oSiR4kfAew0Uq1DB/2DlVYukx8A8r9ny3vyhPF9OewSc9RbXZHGi5Jm0mvecqMGyWemOy6UvbGOECzpDQe4MwrU4MqisEOqEz+sNQv33Jy7cSdB31ywdqUaSBMcMcoLO4kHjXYNv0x/DLdQlDat10vPyv0yFlB7F5DPh/0YiN5hrWsjFMZjiDKCJyK16/Wpt1iFWpi+1/hcWuPik2XtqFk+Y0RnZ/Hx57LWRkeFUmagx9F7Hkx423LA0OuK1t7xdOs0ltgA/bXg47XS3y8hfuxfi0rnRXrrRF92V32E/lUoqqsbkpg4XeltbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiY80NoHcQjeptQOIklSdQx/b/EbjwpM7iW6D8UCXXM=;
 b=AwSU6I+AQCI1e+4O/EnEUf1HK27ora7kFW+aucOUfLaJHmP12vxJ9KXkV3E7/seWTH4tKd3P5zgAOg0wN7J4XHaXzVdt4W4EyY1NQRcYGhaaYw+ZZpmZoJbwpnypMHHuZV/clvqQL52dfBQbmmaeIQ1f0qVssoOwiOaxo9MWJyqaBtRNhZEluSw0Cbg95gYPw/Jwe06S4ZgAqjHRhvJdd/vE4dLAHYQahhr/N/yWEc3m8UmEWfu2aUXQZLkYg/C/snNhYJfaNrnaO/hGNpbaTzvQ6Gi5xZwpDL1lThSS6JOgT+ODEI2UwoeNK4RnOZYTbdlK2mm59ctFgJAlJIv89w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiY80NoHcQjeptQOIklSdQx/b/EbjwpM7iW6D8UCXXM=;
 b=ls8/tS0BmLrviTjd0SxsFRxKI0TcLWC16JJxdZvn5may7a3c3spM6Sd7iIBN4x9+14k7wq4SIsGOCbJUCH7XxM7DeSS9qUmJQnNViarL0AdSFNinrsOMFIQR01XiH9xOMnup57PIEgqlDvbMsWk/k+YaTXOENGRY32FiqJp63SdnNhcTA08adMKcBLSAeff6L72VufOjrmnQpK7zkm4LLbu36ugKo+4Q1CzmdEeCFM1iQm3/eHQkXWQVEJmQoY7LvImy/KsSqj4K2c/hlGbhkOonuzAw0feegS/YXequyv+uSMNt+tvUHF9NhojXbn0YAlVVK2VNRQKXfsbCpE5E8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN1PR12MB2368.namprd12.prod.outlook.com (2603:10b6:802:32::23)
 by PH0PR12MB5648.namprd12.prod.outlook.com (2603:10b6:510:14b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 03:59:30 +0000
Received: from SN1PR12MB2368.namprd12.prod.outlook.com
 ([fe80::281e:52ee:b18e:ad42]) by SN1PR12MB2368.namprd12.prod.outlook.com
 ([fe80::281e:52ee:b18e:ad42%7]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 03:59:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 12:59:23 +0900
Message-Id: <DK5NESIUCJZH.CXHNE27Q0OE9@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 10/10] gpu: nova-core: wait for RISC-V HALTED on FSP
 unload
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260703-blackwell-fixes-v2-0-8e3d8bc32bb9@nvidia.com>
 <20260703-blackwell-fixes-v2-10-8e3d8bc32bb9@nvidia.com>
 <DK5MRB6JWL34.3IRXDQ8KWWAT7@nvidia.com>
In-Reply-To: <DK5MRB6JWL34.3IRXDQ8KWWAT7@nvidia.com>
X-ClientProxiedBy: TYCP286CA0367.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::14) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PR12MB2368:EE_|PH0PR12MB5648:EE_
X-MS-Office365-Filtering-Correlation-Id: f7a444ff-ee29-4804-c079-08dee86ecaf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|366016|7416014|376014|1800799024|6133799003|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AHEsoXH1FmyJnPZ7rDTVKUKHbglp130GDoLSvYF0zATltlBblfrUnW0x8mX0ul+9mlVA10Ok9OnFDrUd/MDrqWg3MVPGpGPEaIY0z8Xh71dzkyOvLOxsXfovnE5mgevnPpveoquS+tllSeyzMgyld1YT8dQmHsfQ9jwEHfgM35x3cVKUiXB2o7oqIy4XLhii0XljI53FvDw3tAr8OsRMvQTI1eyYJP7c8o3Anb4K4OzMfUit2277dT8sS6qo6QvMTgQoyIDOw20XMdmc++LJ5f3Vyguoj3nknI9WrNApdIXiCyX8ulbXLcxEvrhKOhyepHgGvtozSS2xuLh+9O0c66bdDswjLcQwgOB3gNlrLEDUmEpfRr9PuQzG+pstOZrBJqKd+KX1yrLLfA8i09bf9zj+tMoMWY8bpjYx6GjS35Oo089O3eg3EyzRsWuXgpwGUmjG31Y4uL1Bikbq1uyGZMAe4cGb33FgsKwciVWBmh/TfFCHHftvaqnkxQbZCZe56dDNtsoFSFC3okMMQUq7UUntRtmtNdoa81znIxFh0peJzjSRVkihFftaNRnS7DBLNz0Ee0QuoTkb099vUedk4RDN1tGLqVxzjnpYx3XOV58PtDXKJBha3YjYo0NaF755j/DwY3Fj3cbVYTNSl/MMy0c7U0+9jdfjojMShb8tlMY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2368.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(366016)(7416014)(376014)(1800799024)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXdINzJwaEtxeGFCeTJRQXJBcUhQTGE3VC80ZGx3VXFxcDRPQmNxUXo3OFJY?=
 =?utf-8?B?QWxhUHdBMUN6Tk81WVg2T0xDaEJXNVZXUHV5L0lIbUk4VUVReEdpS2owTUJ0?=
 =?utf-8?B?WWFxeGRjc1JvdEszMnZZa1BSSHZSUnhlbGVRVlF4KzFnOFZadmNEWGh3Y0JU?=
 =?utf-8?B?T0huaUYyZ2lRYy91QmVjNnIwZHlLZkNXRFhKdE5xRHYzWjFoZ2xwVWwvbVcy?=
 =?utf-8?B?UEZ1cjJvdXRldHgzNXFpQmNiU2F5TlZjNWRWZ2xKVjNqQjJKOUUrT2paeVli?=
 =?utf-8?B?b0Y5OU9mTzlFNGpaNHU3R3hPOVJVV241YnYvc2dqeFJWdTVGdFl1Q3crSnE1?=
 =?utf-8?B?UnFwMHdpR0pJMDlBbDRHNWJEV0Y1NDlyeGFrOWtuNWVxd0UzalExdEpqcExM?=
 =?utf-8?B?cHdjNUJvbHJoV0Eya3JGaUo5bUlaYkltTXAwbE1YZ29CeXNMN1paTFBPWTg0?=
 =?utf-8?B?WjlXS21Idk1WRC9vWGZMTmd6cUtiQlhoMXhlS1l0NUVjOTZmUnppbnhhdm1l?=
 =?utf-8?B?VjByRTIrdmpLT1Z1OXRpOGpyaFZNVnhDbW4wWXhvdDAwZXJ3NzhxblBlejZC?=
 =?utf-8?B?ZmVpZFBEaWdOTmcraEtJQXpjN0JsUnZ0b1ByMkgxc1gwdmJDRDNuOG5zWC9Y?=
 =?utf-8?B?aFpyZWJnTGpLRkZSNXRBR3VYM3lrVnZ2ZUNxdHp3OUo1MzJBaCt0Q2Z5RTR5?=
 =?utf-8?B?UEhmUnpLNy9vR1BSNFRzMkhGdkJmcWoxSDl2UitHVVRTTExoUmVxU3NHYkF4?=
 =?utf-8?B?L1NxSkNyUk5LK3E1bDhVbkhFbXFxQXEycDhtaGdqdUYyY1VxczAvNmlEL2NI?=
 =?utf-8?B?RnZsRno4NllqaVVrREhFU2gvWVdlb3RXSnVxaFhrTnM3eHl1M2FXNlhpTUYz?=
 =?utf-8?B?VHVROFpIRnVoYkZEN1VtMXI4TGluaGRXYkJ6NEc3dE5pNVVGYTNOSUV1S2t6?=
 =?utf-8?B?TitHK1VxWjVxQ0JJWHZPWUxxNlVieWMxMVd2K1VoYXc1cDFNRUFpc0g1WGlv?=
 =?utf-8?B?bHE0dmxCOGZNanV0S2Z5V2JmNzVLNU9OSktnS0thSVhYODRZcEk5ZVJuZ3Jq?=
 =?utf-8?B?bWdnbm4rK204UGtCTmhuQ0Q5eEhEb3FnNDRZb0hMTG82ZHJtMUlVMWJPa0Jh?=
 =?utf-8?B?ZHJyQUZaR05hKzZwVHlaeXFXNU95eXFTR1ZpcXYwdmxldUthcGlvaWVtNUtH?=
 =?utf-8?B?TDlaSkhGMVQ3TUtxS1I3dHlNRzlYdHpSYk1jeVQwKzNTcFIwUzUzbTF1ZlR3?=
 =?utf-8?B?aWVUWUsvbEk2czJ4bzREbm1ZNHVqaGdWNmlkWjkrbjN0RXZBdTREelFhdStM?=
 =?utf-8?B?Qk1Nejh1MlZhUUhvSTJDcFNqQzhSVExtSmhPWWNpZ1pvc3lNTm8yN3dOaVJB?=
 =?utf-8?B?eFkxU1ZKanBDbXJ0ZmMrVTI4RjhtWTRqOVJLSU8yR2FyTzJERHZaTkN6WUNu?=
 =?utf-8?B?WnpUTUJ3OTE0SEhGYXpZR1RiMTdob25ISCtXUzMwVHhuVGhjYjVhN1RIRG9E?=
 =?utf-8?B?VWovWDBFbVdBVUgyeFd5bE1NNVJ5VVhwd0p2eEt3WDkybk5yUFlycTVNZitx?=
 =?utf-8?B?Zkh0VTM4aEg4ODlGK29vekhKbnRMMGdSWnpMZU9QSi8wYWdQd0c0SldZdzVP?=
 =?utf-8?B?eUhKTmVFTitjaU1IS0NxQ3RxRm1vU2hnNTVvMG04b1BBSzIrSW56dzZNdUF2?=
 =?utf-8?B?NXA3R0FIeFB0RFMvV0Q1Zm9PWk9HdlNWR2IyOVZ6ZWNvRkpsR1RaY3NFL2VX?=
 =?utf-8?B?K1dXMkE2L1NOcVpud1gxSzhoNGM3VVBVNFhkQlRybzNBRWJVSkd0dHdraWhy?=
 =?utf-8?B?Vk5lYnhyelRBTm9QaUU5NXVVbFpSMU1qa2dCc2xGb214ZmFzcGxTanV2Wk81?=
 =?utf-8?B?S2VaVUxkVko5YWYzcjRYQVNaWEtyNWd1QVUvQk5Scndpem1vRzZXNUxGa3pS?=
 =?utf-8?B?VklWdXJxRDlrSW9BQi9GU2RSeldabDdFNWpLVkVZNHl3dnJ0RHZlLytqMHY5?=
 =?utf-8?B?ZVVTdkpDQTg2UGhnWXFmcVlSREZsMDZZc0Z4MlhSMkNIdzByNjhJMkhPRWhD?=
 =?utf-8?B?ZE8rdU5PemlPVmhxeHNPUEhMWmhhU1hxaXVGK2tHSFdLMi8rbWVmVjVHZmdI?=
 =?utf-8?B?ZXlnOGJ0amx5VzJ6QVgzcVc1YVhwMTlaSDRKR3kvU0ZsTmo5SU8xMzN1Ni80?=
 =?utf-8?B?RWlmOE1YMkRpNVdPbkF5ZE5NQ1lOTzZSLzNMRE42T1NlQzhsTG5vcDYvbDUx?=
 =?utf-8?B?aXVlR2l0R3VyZ3FRMW80Z3QvOUdDVVQreEJVSHRTeTh6R25MOUowck91ek54?=
 =?utf-8?B?QlVFWG05S2JvVnZZTEpLNlVwN3NoYjVaR0ZhU0U0SkNHRjZmYzhhZ1BNTTVN?=
 =?utf-8?Q?jWAmnwTgPYnyyuG5vKu7tJ43Xvj6N5Ay13eFPipfFJZd8?=
X-MS-Exchange-AntiSpam-MessageData-1: RFZdEVkj1oWvGg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a444ff-ee29-4804-c079-08dee86ecaf5
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 03:59:29.7622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RS/ixZc0A0WdOLM0aTMExyfT9xGudRUqTzJmYORnQ4G3+SvzLwT+eVyc0oSSCmIb9IDdzCnTcDuHXvIX1xDHRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5648

On Thu Jul 23, 2026 at 12:28 PM JST, Alexandre Courbot wrote:
> On Fri Jul 3, 2026 at 3:22 AM PDT, Eliot Courtney wrote:
>> Currently the code waits for "not active" but this is not the same as
>> halted as there are more than two states. Match openrm here and wait for
>> halted instead.
>>
>> Fixes: c7fea1f70944 ("gpu: nova-core: add non-sec2 unload path")
>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/falcon.rs           | 11 +++++++++++
>>  drivers/gpu/nova-core/falcon/hal.rs       |  5 +++++
>>  drivers/gpu/nova-core/falcon/hal/ga102.rs |  7 +++++++
>>  drivers/gpu/nova-core/falcon/hal/tu102.rs |  4 ++++
>>  drivers/gpu/nova-core/gsp/hal/gh100.rs    | 11 +++++++++--
>>  5 files changed, 36 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/fal=
con.rs
>> index 78948cc8bff3..ec286017535f 100644
>> --- a/drivers/gpu/nova-core/falcon.rs
>> +++ b/drivers/gpu/nova-core/falcon.rs
>> @@ -749,11 +749,22 @@ pub(crate) fn signature_reg_fuse_version(
>> =20
>>      /// Check if the RISC-V core is active.
>>      ///
>> +    /// Note that this does not imply that the RISC-V core is halted if=
 it returns `false`.
>
> I would say "guarantee" instead of "imply" here, wdyt?

Yes I think "guarantee" is better here since otherwise you need the
mathematical reading of "imply" to not think it's an if-and-only-if.

>
>> +    ///
>>      /// Returns `true` if the RISC-V core is active, `false` otherwise.
>>      pub(crate) fn is_riscv_active(&self) -> bool {
>>          self.hal.is_riscv_active(self)
>>      }
>> =20
>> +    /// Checks whether the RISC-V core is halted.
>> +    ///
>> +    /// Note that this does not imply that the RISC-V core is active if=
 it returns `false`.
>
> Same here.
>
>> +    ///
>> +    /// Returns [`ENOTSUPP`] if the status is not available.
>> +    pub(crate) fn is_riscv_halted(&self) -> Result<bool> {
>> +        self.hal.is_riscv_halted(self)
>> +    }
>> +
>>      /// Load a firmware image into Falcon memory, using the preferred m=
ethod for the current
>>      /// chipset.
>>      pub(crate) fn load<F: FalconFirmware<Target =3D E> + FalconDmaLoada=
ble>(&self, fw: &F) -> Result {
>> diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core=
/falcon/hal.rs
>> index ee4a017f3a4c..7e532889a1f4 100644
>> --- a/drivers/gpu/nova-core/falcon/hal.rs
>> +++ b/drivers/gpu/nova-core/falcon/hal.rs
>> @@ -53,6 +53,11 @@ fn signature_reg_fuse_version(
>>      /// Returns `true` if the RISC-V core is active, `false` otherwise.
>>      fn is_riscv_active(&self, falcon: &Falcon<'_, E>) -> bool;
>> =20
>> +    /// Checks whether the RISC-V core is halted.
>> +    ///
>> +    /// Returns [`ENOTSUPP`] if the chipset does not expose RISC-V halt=
 status.
>> +    fn is_riscv_halted(&self, falcon: &Falcon<'_, E>) -> Result<bool>;
>
> It's a bit unfortunate that we add a runtime error check for something
> that is essentially known to never fail (the GSP's GH100 HAL being the
> sole caller of this method). I cannot think of a better design at
> the moment, but this hints that our HAL could be improved as I think we
> already have several instances of the same pattern elsewhere.
>
> Not a big deal anyway - if you can confirm my wording nit above, this
> one should be good to merge as well.

Yeah, I couldn't think of a good way to do this either and I was unhappy
about it. Wording nit sgtm. Thanks!
