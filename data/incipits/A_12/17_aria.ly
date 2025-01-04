\version "2.24.2"
\include "header.ly"

sempreP = \markup \remark \whiteout \pad-markup #0.5 \concat { "sempre " \bold \fontsize #2 "p" }

Oboe = {
  \relative c' {
    \clef treble
    \key d \minor \time 6/8 \tempoMarkup "Largo"
    d'4_\sempreP a8 f'8. e16 d8
    b!8. a16 gis8 \hA \grace gis a4 r8 \gotoBar "13"
    R2.*4
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 6/8 \tempoMarkup "Largo"
    d'4_\sempreP^\conSord a8 f'8. e16 d8
    b!8. a16 gis8 \hA \grace gis a4 r8 \gotoBar "13"
    r4 r8 f8.\p e16 d8
    b'!8. a16 gis8 a8. cis16 e8
    a,4 e'8~ e d c
    h8. c16 d8~ d c b
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 6/8 \tempoMarkup "Largo"
    f8.-\sempreP^\conSord d32 e f16 g a8. g16 f8
    f4 e8 e4 r8 \gotoBar "13"
    r4 r8 a8.\p g16 f8
    f4 e8 e4 r8
    e8. fis16 g8 \hA fis8. g16 a8
    d,8. e16 f8 e8. f16 g8
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \key d \minor \time 6/8 \autoBeamOff \tempoMarkup "Largo"
    R2.*2 \gotoBar "13"
    d4 a8 f'8.[ e16] d8
    b!8.[ a16] gis8 \hA \grace gis a4 r8
    e'4 g,8 fis[ a] c!
    h16[ c d8] f, e[ g] b
  }
}

SoliLyrics = \lyricmode {
  Leicht -- lich iſt __ ge --
  dul -- dig ſeyn,
  wo kein Schmer -- tzen
  in __ den Her -- tzen,
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \minor \time 6/8 \tempoMarkup "Largo"
    d4-\sempreP r8 d4 r8
    d4. cis4 r8 \gotoBar "13"
    d,4 r8 d'4 r8
    d4. cis4 r8
    cis4. d4 r8
    g,4 r8 c4 r8
  }
}

BassFigures = \figuremode {
  r2.
  <6->4 <4\+ 2>8 <6>4.
  r2.
  <6>4 <4\+ 2>8 <6>4.
  q4 <5>8 <9 _+> <8 \t>4
  <_!>4. <9 _!>8 <8 \t>4
}

\score {
  <<
    \new Staff {
      \set Staff.instrumentName = "ob"
      \Oboe
    }
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "Job"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  % \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
