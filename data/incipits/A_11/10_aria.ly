\version "2.24.2"
\include "header.ly"

Cello = {
  \relative c' {
    \clef tenor
    \twofourtime \key d \minor \time 2/4 \tempoMarkup "Allegro moderato"
    \partial 8 a8 d16 a a8\trill d16 a a8\trill
    \appoggiatura { d16[ e] } f4. e16 d \gotoBar "22"
    d,16 d' a f d4
    R2*3
    \clef bass r8 d'\p d d
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key d \minor \time 2/4 \tempoMarkup "Allegro moderato"
    \partial 8 r8 a'8.^\conSord f16 a8. f16
    a f f d d8. f'16 \gotoBar "22"
    d,4 r
    R2
    r16 a'' e cis a \hA cis a e
    cis8 a r4
    r8 a'\p a a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key d \minor \time 2/4 \tempoMarkup "Allegro moderato"
    \partial 8 r8 f8.^\conSord d16 f8. d16
    f a a f f8. d'16 \gotoBar "22"
    d4 r
    R2
    r16 e cis a e a e cis
    a4 r
    r8 f'\p f f
  }
}

Soli = {
  \relative c {
    \clef bass
    \twofourtime \key d \minor \time 2/4 \autoBeamOff \tempoMarkup "Allegro moderato"
    \partial 8 r8 R2*2 \gotoBar "22"
    r4 r8 a'
    d a f d
    \appoggiatura d cis4 r8 a'
    e' cis a g
    f16[ g a g] f[ e d c!]
  }
}

SoliLyrics = \lyricmode {
  Eß
  le -- be dan mein
  Kind, und
  ich will vor ihm
  ſter \hy
}

Continuo = {
  \relative c {
    \clef bass
    \twofourtime \key d \minor \time 2/4 \tempoMarkup "Allegro moderato"
    \partial 8 r8 \mvTr d\p-\markup \remark "sempre" d d d
    d d d d \gotoBar "22"
    d4 r
    d\p r8 d
    a a a a
    cis4 r
    d8\pp d d d
  }
}

BassFigures = \figuremode {
  r8 r2
  r
  r2
  r
  <_+>
  r
  r
}

\score {
  <<
    \new Staff {
      \set Staff.instrumentName = \markup \center-column { "vlc" "solo" }
      \Cello
    }
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
        \set Staff.instrumentName = "Vatter"
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
}
