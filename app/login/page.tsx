'use client'
import { useSession } from 'next-auth/react'

import LoginButton from '@/components/LoginButton'

import Autocomplete, { createFilterOptions } from '@mui/material/Autocomplete'
import Stack from '@mui/material/Stack'
import { Container } from '@mui/material'
import Button from '@mui/material/Button'
import TextField from '@mui/material/TextField'
import Dialog from '@mui/material/Dialog'
import DialogActions from '@mui/material/DialogActions'
import DialogContent from '@mui/material/DialogContent'
import DialogContentText from '@mui/material/DialogContentText'
import DialogTitle from '@mui/material/DialogTitle'
import React, { useEffect } from 'react'
import { FilterOptionsState } from '@mui/material'

interface CategoryType {
  inputValue?: string
  name: string
}

interface FormValues {
  name?: string
  description?: string
  ingredients?: string
  categories?: string[]
}

const filter = createFilterOptions<CategoryType>()

export default function Login() {
  const [formValues, setFormValues] = React.useState<FormValues>({ name: '', description: '', ingredients: '' })
  const [imageUrl, setImageUrl] = React.useState(null)
  const [open, setOpen] = React.useState(false)
  const [value, setValue] = React.useState<CategoryType | null>(null)

  const { data: session, status } = useSession()

  const handleTextFieldChange = (event: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    const { name, value } = event.target
    setFormValues({
      ...formValues,
      [name]: value
    })
  }

  useEffect(() => {
    if (status === 'authenticated') {
      setOpen(true)
    }
  }, [status])

  if (status === 'unauthenticated') {
    return <LoginButton />
  }

  const handleClose = () => {
    console.log(JSON.stringify(formValues))

    if (
      Object.values(formValues).every((v) => v?.length > 0) ||
      Object.values(formValues).every((v) => v?.length === 0)
    ) {
      setOpen(false)
    }
  }

  return (
    status === 'authenticated' && (
      <Dialog fullWidth={true} maxWidth={'sm'} open={open} onClose={handleClose}>
        <Stack spacing={2}>
          <form
            action="/"
            method="POST"
            onSubmit={(e) => {
              e.preventDefault()
              alert('Submitted form!')
              handleClose()
            }}
          >
            <DialogTitle>Lägg till nytt recept</DialogTitle>
            <DialogContent>
              <TextField
                autoFocus
                margin="dense"
                id="name"
                name="name"
                label="Namnet på ditt recept"
                type="text"
                fullWidth
                variant="standard"
                sx={{ my: '1' }}
                onChange={handleTextFieldChange}
              />
              <TextField
                margin="dense"
                id="description"
                name="description"
                label="Instruktioner på hur man tillagar receptet"
                type="text"
                fullWidth
                multiline
                rows="4"
                variant="standard"
                onChange={handleTextFieldChange}
              />
              <TextField
                margin="dense"
                id="ingredients"
                name="ingredients"
                label="Lista på ingredienser"
                type="text"
                fullWidth
                multiline
                rows="4"
                variant="standard"
                onChange={handleTextFieldChange}
              />
            </DialogContent>
            <DialogActions>
              <Button onClick={handleClose}>Avbryt</Button>
              <Button onClick={handleClose}>Lägg till</Button>
            </DialogActions>
          </form>
        </Stack>
      </Dialog>
    )
  )
}

const categories = [
  { name: 'Middag', inputValue: '' },
  { name: 'Frukost', inputValue: '' },
  { name: 'Dessert', inputValue: '' },
  { name: 'Fest', inputValue: '' },
  { name: 'Bakelse', inputValue: '' },
  { name: 'Högtid', inputValue: '' }
]
