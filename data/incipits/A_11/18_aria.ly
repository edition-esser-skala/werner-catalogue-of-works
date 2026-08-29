\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \dorian \time 4/4 \tempoMarkup "Andante"
    r4 d'8 cis d a' g f
    e a,16 h c8 h a c' h a \gotoBar "8"
    f, d' e, cis' d d, r4
    r2 cis'16\p a d a e'8 a,
    R1*2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \dorian \time 4/4 \tempoMarkup "Andante"
    R1
    r4 a'8 gis a e' d c \gotoBar "8"
    f, d' e, cis' d d, r4
    r2 cis'16\p a d a e'8 a,
    R1*2
  }
}

Soli = {
  \relative c' {
    \clef alto
    \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*2 \gotoBar "8"
    r2 r4 d8 cis
    d a' g f e4 a,8 e'
    f g16[ a] b8 d, \appoggiatura d cis4 e8 f
    cis d e f cis d e fis
  }
}

SoliLyrics = \lyricmode {
  Nun bin
  ich ſchon wohl ge -- tröſt daß mein
  groſ -- ſer Sün -- den -- reſt al -- le --
  maſ -- ſen nach -- ge -- laſ -- ſen und "hin -"
}

Continuo = {
  \relative c {
    \clef bass
    \key d \dorian \time 4/4 \tempoMarkup "Andante"
    d4. e8 f4 g
    a a,8 h c4 d \gotoBar "8"
    d8 f g a d,4. e8
    f4 g a8 h cis a
    d4 g, a8 a,16 h cis8 d
    e f cis d e f cis d
  }
}

BassFigures = \figuremode {
  r4. <6\\>8 r4 <6>8 <5>
  <_+>4 <_!>8 <6\\> <6>4 q8 <5>
  r4 <6 5>8 <_+>2 <6\\>8
  <6>4 q8 <5> <_+>2
  r4 <_->2.
  <6\\>8 <6>4. <6\\>8 <6>4 <_+>8
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
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
        \set Staff.instrumentName = \markup \center-column { "Verlohrener" "Sohn" }
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  % \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
