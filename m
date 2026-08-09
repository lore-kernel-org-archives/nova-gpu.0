Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012028.outbound.protection.outlook.com [40.107.209.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380443603C7
	for <nova-gpu@lists.linux.dev>; Sun,  9 Aug 2026 21:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786311825; cv=fail; b=cQUbltkTSXFDGFmHpA2Ij7sCB/V4Eu1k/iRoVBgthtIj5tvab4FtnKOS5lbiCQWR/BFxy2lvTII7yu4FyEChqsTu5s/fWrriwCNppiGr9UnFtZgOVA/Wln513QTapprCKe0CYr3s7cu+PehabKenJ3gb8cC8imLeeXYxPc9hRGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786311825; c=relaxed/simple;
	bh=Q1A7SenlKH9bHaT1b4LYlyVWBRLO7zyi41r15Ghx9UU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kRsNIRCNDtysRZTprcyQvbZztY6+6q8aSUH5M5BxhPK4K39g+6pECd3ork51R3UeAefpLrEoCQYIZ1MJqZOF/kYyCQSKG71UVCBEYYQofsGv4XKNqDt0E+WFGyC8a5BXKb5dgBBnpB/EQJSCORNq4cUlVC0EMKsQe5zm8gKUso4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bVBA3HZ9; arc=fail smtp.client-ip=40.107.209.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bVBA3HZ9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUWMPEGpy0t0oXNmCba58TFmNF+05eBCKGOI2HHm7UUth1ymlGfmYFbNSGMeeukptVQku2xRJs1nXsyIpgDL8A+87RkHkdzyCZhshqowIRD+9K10oMunHKvz5d+cGQcUgbbkK9HsNckad7RLM6wY4kl7nN9np3M/RVqZq1u391QMgtpSJO50bpJHZvKvfOfAYrla2w9H5hxUP96sjSe+uLopzOOqaBndl6z+RBi5ZSvLxYU31Q43aC7XIbQOwMaTdKqwOz00wXTHGiWxOGyZx9czfWLkd5O7D3DosaPJtz5AnbfLWKAFLbTyS6Go6Q1jO5QF1MzrjqDO09lhjrtbbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBQY2hDHZ469vPxbziAqYWuU4lGzm/kic5CBtuu9hGo=;
 b=x7FZ9B4EswOl1T8s9uoiQVtCUoXpDZGdT3WKPVYY7bspshwnJEwJMWiDYU40fzvMgks4wzLLMd2s7/u3T/3XbxlBQIADv3zCVjZoOgragH5kbO8nd/3xhoYAPV2hEaGlEtvBXE+TJECTktB7PqHuA+P9nOetVOhIFGx1j9K6F0oE1smDilygXpe4OywtzJ+ijyZbXYOKrnFRk1uDHPtObE91uaTm7VMbhNoy+/jbfe0OLBHoUt8sfQMsPHs+iDrhX0E9OlFQlYUbWkFJWI/IJAKuvcUo5os3ICHUdsoGd7uqD8J4DDwt5Ktni6D+UF7F6Ff+YaNXGdVxRxi+bsSOzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBQY2hDHZ469vPxbziAqYWuU4lGzm/kic5CBtuu9hGo=;
 b=bVBA3HZ9LqaWulYlM+e7piJe7X5FvrAeZGj0qsbLRR+VAJAJkM9eJkgv7P0yISJSZI0U5KS7opep6COejja/feQdV1X1+uSUsYbG9cIe4QCHadcbvkz0fSsDxK/uz8p5mTN+92fOdG8e6pSUUjuPXC8ahWT0LZkzZmliZwN19QsA1OSI1Xcle52+li54m34x4f+uUohdHUukKpCTAIgKVw3cSaZX23E6rVNLxiZawF7uHUgaNY9pKAyR8IiNsHZQiY5dApuE3BTJjQmo/6nrFAETiN7ptQxznFfem8dxpv9s6BM5aGP9YADFr8ReUmTyHIufspDokwe3XJTANxpoUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4170.namprd12.prod.outlook.com (2603:10b6:5:219::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.23; Sun, 9 Aug 2026 21:43:39 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.024; Sun, 9 Aug 2026
 21:43:39 +0000
Message-ID: <6b9c5a94-090a-4035-a20c-027cdedceb4c@nvidia.com>
Date: Sun, 9 Aug 2026 14:43:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] rust: sync: completion: add
 wait_for_completion_timeout()
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
 <20260808031120.363869-2-jhubbard@nvidia.com>
 <DKK2DM3VK6TF.3KBBWP7S4A8T1@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DKK2DM3VK6TF.3KBBWP7S4A8T1@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4170:EE_
X-MS-Office365-Filtering-Correlation-Id: 50724758-2b10-47c7-e564-08def65f45f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|10070799003|1800799024|6133799003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	T7j3EpRTDmxxYRfmnxg6KycbPIxbyP+BmpeZHq3iiwCuW67MNV6MX1ldKAlQtDB/HslEPwE5h7jKXrfo5pofP11c4b/0q8s/mrOaDjcviyohyYlGRyW70hsIOA+6gzPizkvy18mni1FnkBIsm5Rup2hP4TAdODFvFRhogLVQrIXSod7RM6x/kBywuGBpX3KprEpSLcM60bhTs/rrhKL+GNMvnbvk3HByD2wTOXE81I7JVnP9Hah0+xjkScm80XoSkPJQgXUDW/zoXEn158roOqgHKBSqJrJxQRpnQiVI+QnKG0RN1/GNf6hS7FqtqSd7NJkuOm+ZKXfc00av4njI6YqZ8gMtfk0ux736KuIbslM/ZcniveHN1tp7QGKI0dk6T3OSxG2djDnEsCbvvAlg3uC2AP+m3hPwmJ92lz0sFz7TYRhlOdR6MIEeK9ZgtGEfLlG9AtJgNtfbG8D9k+/Zs18UMGI8k6Eoq++OHU6CZPAJH8V+SprWlv1nfrLAa4RcYhS2KDRLIXtQCxsOUpnnDIbqgLsSaVlXI0jRpCoTtnu0hm7mvhd1wiIYj8b5bNJDOvMFInVa6ZGazRPQtWG+J3vlqougMetyhXRjn5vCGi+bErJsk7+HcOcdl1pZe76Yb6b60xhHEfBCQvsmW6NT6KH2fPlDjek/L1PsSUv2YYo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(10070799003)(1800799024)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFhvL0M2QnRLQ3JsRG43MHM5a3psTEZGYzAzajEwOUdLQlJuMDFETlZRZDNQ?=
 =?utf-8?B?NTBnOW92U1FvQUpDNXp1Y1FCSmM0N0FYZ3FwQlRLQXBDd3JXcW9BWFZZOHlz?=
 =?utf-8?B?Q2k1N3JTUmkySndtVXloQkM4cWNLUzl5ZDU4NFJTU3hEZDUxNy93YjFUVWhw?=
 =?utf-8?B?d0JqcmJ0QW5VOW5oaTloK0pod21QUG40QU0zQno4ZCtCTjNZUXZYOHJCRUJD?=
 =?utf-8?B?OXI0RFNOSE9NanFNdkNKaW5COEk4REhWVDk3U0hQVVNGMzhlSTlnQld4WHZB?=
 =?utf-8?B?eTdKQVRNU3JuN1BYRHJISjkyUFl0Qmp4MnlYbGhUcHJDS1B0ZytYM2tuRzY3?=
 =?utf-8?B?Rmh0dE9aemtKMG40NDdtd3Y3ZzVualowNXJYY0J4dW9mYWkyT3dkdmV6R2FO?=
 =?utf-8?B?RTFMQm5ncU04N3djVE96OHdQZnpPa3U1L25BTm53V1RPUzlzV2JzZ3JEc2NI?=
 =?utf-8?B?OVk5VDdhcEtxWUVoVEE1QTVQTTFReGJ6OHprdVBWQ0FYV1VWaEVkWXI0YW1p?=
 =?utf-8?B?M01Na0dZMEtjRE0xeWoxWWQ1ZmxRNWNPUVVkOFcyVk1OTHZNME16STZxN2kr?=
 =?utf-8?B?L2UrSXJJeHB0K3BoT2JpU2wyVlVkT2xOR1JDaGpEMGdxYUszdFVncHRoOE9n?=
 =?utf-8?B?WE8vTWt3WGVNblI3MXRjbWRvUExwSC9yYndzd3NkdjFsU3UrRGNSMmhjTTZK?=
 =?utf-8?B?NzZ5RG1iSnlvaFNVODM2YmwyRWwrb3R1SVhzNFRPN3pJVVE3Ri9WZkpuZHB3?=
 =?utf-8?B?L0VQcktWRyt6dnVjbkg4dHVPWGZtdm1MNXlVRUZNUkt1cGNiWkZxMjh5TWo0?=
 =?utf-8?B?V3NWNzZ0bVFDUVUyUmNOMUVRQ2tEM3RXRXRJNVh4RnM2Vy9FYVF4QVJDZFpX?=
 =?utf-8?B?ay9CeExoM2VDemY2b0UzVFlQYlVtNCs2Mjk1RHRkZU5uT0tLeXkwWVJiUEd3?=
 =?utf-8?B?SGdjLzgyd052Q3doRkVIS2RjKythOWRHM1h4Vk9Ndlc3cmE0VWtrdWlSTjZW?=
 =?utf-8?B?S3lnemxOdFE4VG01ZWdsN05rL2NIRzRPNW1WMmxyZTVNQW1PSGRJb2ozVmc0?=
 =?utf-8?B?TnJ0SE5EaWxFN0orUWxkeWg1S3dlemo2V3QyZ1pwM2lETEY1bE1MN3dBWmNO?=
 =?utf-8?B?RC9iZVJQd3p0a1RmT3hzNlNxZDBwTFE4QnFnK2I0Q24xZXVEcEFMQVlIMDRH?=
 =?utf-8?B?Z2F1bkQyT1VxRE1yNkpzZWFoanpFeU42bzRNcnI4MHVlbmw1bkJoa2lVN3Z2?=
 =?utf-8?B?VlFNVFhpVS9NZTRoK09TalJmb2R6SUNDQldsaHI3MmMyNnV4K2xscG4xaTli?=
 =?utf-8?B?R3BVQWN1bUJuTzVPSkJ6b3BoTitZTmVjeTZrYVU5dWhJdTRpZm1EYnZ5RmxF?=
 =?utf-8?B?bk9SeFFzWG9xUkMzcE5qa2NzZTdFK1JyVEVBT1g0LzhYa0dPVnJrRUZ5RnpI?=
 =?utf-8?B?eWpiaE5sSHM1ejBoeGk0SXNYS0JqdFZyZFBDYXhmNnhzN2JubXFVV3laY1lh?=
 =?utf-8?B?UG0waTgxYy96Q2JlcExtWitPK1U3Y3lDRkF3a0tWNzU5dHpJaXdDam9LaFhl?=
 =?utf-8?B?V0ZMbTA4aGh1cHEySTlDTmtVYTJmOWFhSjZHQ2VuYzBmSTRVWHZIdlpENHdV?=
 =?utf-8?B?cjVFUmZtUGtpcDIzV0NCMEd5OVlxdlNoN1F0SDgwSlhWWE5Ra1IwMkw3LzNl?=
 =?utf-8?B?MjFzNUtXaE15dFRWanl5WmVOTytwTG90NWNmV3FKUEx2cWI4N2g2OVY4ZmN2?=
 =?utf-8?B?aldhUG1pU244cys5TzVvVG1YUzF4NWI5dlpaRHJxSjRBOFZXaDJSY25GYk91?=
 =?utf-8?B?UGdFRThGKzFzMTNCaGRxNERpdUlJQWpHVkJNUm96RkJsSW9hVkgrZE9PSjRw?=
 =?utf-8?B?amFZSDh2S2xmbGxEYVM4RGhzNk1DbDNIY2EyZ3FMVThYZnhVU0VnVlBMSWlv?=
 =?utf-8?B?dStJWmMwY2gvbWpBYmVack5ST2VKU3dsb1JMc1MyZER0NUNFV0hGdmU0Ujc0?=
 =?utf-8?B?U0tqSGVlOG1IazBwSGpDeHdTWkgzZEVJc2VKODhVRUp1MFFBT1BNRGVZVjd3?=
 =?utf-8?B?QXVzL215ekNOS2tqQmJ6VDZyQWtpejRaenh3d0tHSGRGQStHYWQ3RTVaNmFJ?=
 =?utf-8?B?dzJwWEhralU0NDl1ZHRQZnZETE0yMFZpenVNUjgwcUh1eUgxVVFhc2JQejVu?=
 =?utf-8?B?Q0pOczg4aCtyL2t5QSt2QzNiYnVzRnJxWVZieThnQmNYekFyT3Z3bkt5aUQw?=
 =?utf-8?B?YmZzMzM2Yy9DVGRyVVBEMG52NkRIZ0o0bERxK3AvMWJwL3Y2QzY3c3IwaGI0?=
 =?utf-8?B?dTRtT0tHVVYwMG54M2VJZXVOOUFCRXRBUjd3NlJmYWFVZDNmUjRuZDJ0MVBV?=
 =?utf-8?Q?Rk/RRy23hFjGzPZg=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50724758-2b10-47c7-e564-08def65f45f5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 21:43:39.1219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/82AZ7wO5647QSG4NGQ68qqC3XcnroklVhw/1rdMjC59AgUqCaPf4zSs2+nwEZC7Hf6QBU8EHWcYu+rowQtfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4170

On 8/8/26 7:40 PM, Alexandre Courbot wrote:
> On Sat Aug 8, 2026 at 12:11 PM JST, John Hubbard wrote:
>> From: Joel Fernandes <joelagnelf@nvidia.com>
>>
>> A driver that runs an interrupt self-test during probe waits for the
>> handler to fire. wait_for_completion() has no timeout, so a broken
>> interrupt path stalls probe indefinitely. Add a timeout variant of
>> wait_for_completion().
>>
>> Document the type invariant that Completion always holds an initialized
>> struct completion, and cite it in the SAFETY comments.
> 
> That last paragraph (and the associated hunks below) are a different
> thing, and should be its own patch.

OK.

> 
> <...>
>>   /// Synchronization primitive to signal when a certain task has been completed.
>>   ///
>>   /// The [`Completion`] synchronization primitive signals when a certain task has been completed by
>>   /// waking up other tasks that have been queued up to wait for the [`Completion`] to be completed.
>>   ///
>> +/// # Invariants
>> +///
>> +/// `inner` always holds an initialized `struct completion`.
>> +///
>>   /// # Examples
>>   ///
>>   /// ```
>> @@ -96,7 +105,8 @@ fn as_raw(&self) -> *mut bindings::completion {
>>       /// completion is permanently done, i.e. signals all current and future waiters.
>>       #[inline]
>>       pub fn complete_all(&self) {
>> -        // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
>> +        // SAFETY: By the type invariant, `self.as_raw()` is a pointer to an initialized
>> +        // `struct completion`.
>>           unsafe { bindings::complete_all(self.as_raw()) };
>>       }
>>   
>> @@ -108,7 +118,25 @@ pub fn complete_all(&self) {
>>       /// See also [`Completion::complete_all`].
>>       #[inline]
>>       pub fn wait_for_completion(&self) {
>> -        // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
>> +        // SAFETY: By the type invariant, `self.as_raw()` is a pointer to an initialized
>> +        // `struct completion`.
>>           unsafe { bindings::wait_for_completion(self.as_raw()) };
>>       }
> 
> These hunks are what should be extracted, or even dropped as
> `wait_for_completion_timeout` doesn't add any extra requirement for
> them.
OK, I'll just drop those entirely.

thanks,
-- 
John Hubbard

